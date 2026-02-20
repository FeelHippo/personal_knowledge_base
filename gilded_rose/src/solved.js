class Item {
  constructor(name, sellIn, quality){
    this.name = name;
    this.sellIn = sellIn;
    this.quality = quality;
  }
}

const BRIE = 'aged brie';
const BACKSTAGE = 'backstage passes';
const SULFURAS = 'sulfuras';
const CONJURED = 'conjured';

class Shop {
  constructor(items=[]){
    this.items = items;
  }
  updateQuality() {
    // this.items might be an empty list, see the constructor
    // in which case .map() will simply return an empty list
    return this
      .items
      .map(
        ({
          name, 
          sellIn, 
          quality,
        }) => {
          switch (true) {
            case name.toLowerCase().includes(BRIE):
              // __"Aged Brie"__ actually increases in `Quality` the older it gets
              sellIn = this.updateSellIn(sellIn);
              quality = this.updateBrieQuality(quality);
              break;
            case name.toLowerCase().includes(BACKSTAGE):
              // __"Backstage passes"__, like aged brie, increases in `Quality` as its `SellIn` value approaches;
              sellIn = this.updateSellIn(sellIn);
              quality = this.updateBackstageQuality(sellIn, quality);
              break;
            case name.toLowerCase().includes(SULFURAS):
              // __"Sulfuras"__, being a legendary item, never has to be sold or decreases in `Quality`
              break;
            case name.toLowerCase().includes(CONJURED):
              // __"Conjured"__ items degrade in `Quality` twice as fast as normal items
              sellIn = this.updateSellIn(sellIn);
              quality = this.updateDefaultQuality(
                sellIn,
                this.updateDefaultQuality(sellIn, quality),
              );
              break;
            default:
              sellIn = this.updateSellIn(sellIn);
              quality = this.updateDefaultQuality(sellIn, quality);
              break;
          }
          return {
            name,
            sellIn,
            quality,
          }
        }
      );
  }

  updateSellIn(sellIn) {
    // decrease sellIn. 
    // Expiration date is 0, and cannot be negative
    return Math.max(0, sellIn - 1);

  }

  updateDefaultQuality(sellIn, quality) {
    // Once the sell by date has passed, `Quality` degrades twice as fast
    // The `Quality` of an item is never negative
    return Math.max(
      0,
      sellIn
        ? quality - 1 
        : quality - 2
    );
  }

  updateBrieQuality(quality) {
    // The `Quality` of an item is never more than `50`
    return Math.min(50, quality + 1);
  }

  updateBackstageQuality(sellIn, quality) {
    // `Quality` increases by `2` when there are `10` days or less and by `3` when there are `5` days or less but
	  // `Quality` drops to `0` after the concert
    let updatedQuality;
    switch (true) {
      case sellIn > 10:
        updatedQuality = quality + 1;
        break;
      case sellIn <= 10 && sellIn > 5:
        updatedQuality = quality + 2;
        break;
      case sellIn <= 5 && sellIn > 0:
        updatedQuality = quality + 3;
        break;
      default:
        return 0;
    }
    return Math.min(50, updatedQuality);
  }

}

module.exports = {
  Item,
  Shop
}
