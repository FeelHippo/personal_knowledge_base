const {Shop, Item} = require("../src/solved.js");

// default
// sellIn > 0 => sellIn is decreased by one
// quality is positive => quality is decreased by one

const defaultSellInAndQuality = {
  before: {
    name: '+5 Dexterity Vest',
    sellIn: 7,
    quality: 10,
  },
  after: {
    name: '+5 Dexterity Vest',
    sellIn: 6,
    quality: 9,
  },
};

// sellIn > 0 => sellIn is decreased by one
// quality 0 => quality is still 0

const defaultSellInAndNoQuality = {
  before: {
    name: '+5 Dexterity Vest',
    sellIn: 7,
    quality: 0,
  },
  after: {
    name: '+5 Dexterity Vest',
    sellIn: 6,
    quality: 0,
  },
};

// sellIn == 0 => sellIn is still 0
// quality is positive => quality is decreased by two

const defaultNoSellInAndQuality = {
  before: {
    name: '+5 Dexterity Vest',
    sellIn: 0,
    quality: 10,
  },
  after: {
    name: '+5 Dexterity Vest',
    sellIn: 0,
    quality: 8,
  },
};

// sellIn == 0 => sellIn is still 0
// quality 0 => quality is still 0

const defaultNoSellInAndNoQuality = {
  before: {
    name: '+5 Dexterity Vest',
    sellIn: 0,
    quality: 0,
  },
  after: {
    name: '+5 Dexterity Vest',
    sellIn: 0,
    quality: 0,
  },
};

// brie
// sellIn > 0 => sellIn is decreased by one
// quality is < 50 => quality is increased by one

const brieSellInAndQuality = {
  before: {
    name: 'Aged Brie',
    sellIn: 7,
    quality: 40,
  },
  after: {
    name: 'Aged Brie',
    sellIn: 6,
    quality: 41,
  },
};

// sellIn > 0 => sellIn is decreased by one
// quality == 50 => quality is still 50

const brieSellInAndTopQuality = {
  before: {
    name: 'Aged Brie',
    sellIn: 7,
    quality: 50,
  },
  after: {
    name: 'Aged Brie',
    sellIn: 6,
    quality: 50,
  },
};

// sellIn == 0 => sellIn is still 0
// quality is < 50 => quality is increased by one

const brieNoSellInAndQuality = {
  before: {
    name: 'Aged Brie',
    sellIn: 0,
    quality: 40,
  },
  after: {
    name: 'Aged Brie',
    sellIn: 0,
    quality: 41,
  },
};

// sellIn == 0 => sellIn is still 0
// quality == 50 => quality is still 50

const brieNoSellInAndTopQuality = {
  before: {
    name: 'Aged Brie',
    sellIn: 0,
    quality: 50,
  },
  after: {
    name: 'Aged Brie',
    sellIn: 0,
    quality: 50,
  },
};

// sulfuras
// sellIn and quality are unchanged

const sulfurasSellInAndQuality = {
  before: {
    name: 'Sulfuras, Hand of Ragnaros',
    sellIn: 7,
    quality: 10,
  },
  after: {
    name: 'Sulfuras, Hand of Ragnaros',
    sellIn: 7,
    quality: 10,
  },
};

// backstage
// sellIn > 10 => sellIn is decreased by one
// quality is < 50 => quality is increased by one

const backstageTopSellInAndQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 14,
    quality: 40,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 13,
    quality: 41,
  },
};

// sellIn > 10 => sellIn is decreased by one
// quality == 50 => quality is still 50

const backstageTopSellInAndTopQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 14,
    quality: 50,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 13,
    quality: 50,
  },
};

// sellIn <= 10 && > 5 => sellIn is decreased by one
// quality is < 50 => quality is increased by two
// but never more than 50

const backstageMidSellInAndQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 9,
    quality: 40,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 8,
    quality: 42,
  },
};

const backstageMidSellInAndLimitQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 9,
    quality: 49,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 8,
    quality: 50,
  },
};

// sellIn <= 10 && > 5 => sellIn is decreased by one
// quality == 50 => quality is still 50

const backstageMidSellInAndTopQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 6,
    quality: 50,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 5,
    quality: 50,
  },
};

// sellIn <= 5 && > 0 => sellIn is decreased by one
// quality is < 50 => quality is increased by three
// but never more than 50

const backstageLowSellInAndQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 4,
    quality: 40,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 3,
    quality: 43,
  },
};

const backstageLowSellInAndLimitQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 4,
    quality: 48,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 3,
    quality: 50,
  },
};

// sellIn <= 5 && > 0 => sellIn is decreased by one
// quality == 50 => quality is still 50

const backstageLowSellInAndTopQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 4,
    quality: 50,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 3,
    quality: 50,
  },
};

// sellIn == 0 => sellIn is still 0
// quality == 0

const backstageNoSellInAndNoQuality = {
  before: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 1,
    quality: 40,
  },
  after: {
    name: 'Backstage passes to a TAFKAL80ETC concert',
    sellIn: 0,
    quality: 0,
  },
};

// conjured
// sellIn > 0 => sellIn is decreased by one
// quality is positive => quality is decreased by two

const conjuredSellInAndQuality = {
  before: {
    name: 'Conjured Diapers ++',
    sellIn: 4,
    quality: 40,
  },
  after: {
    name: 'Conjured Diapers ++',
    sellIn: 3,
    quality: 38,
  },
};

// sellIn > 0 => sellIn is decreased by one
// quality 0 => quality is still 0

const conjuredSellInAndNoQuality = {
  before: {
    name: 'Conjured Diapers ++',
    sellIn: 4,
    quality: 0,
  },
  after: {
    name: 'Conjured Diapers ++',
    sellIn: 3,
    quality: 0,
  },
};

// sellIn == 0 => sellIn is still 0
// quality is positive => quality is decreased by four

const conjuredNoSellInAndQuality = {
  before: {
    name: 'Conjured Diapers ++',
    sellIn: 0,
    quality: 40,
  },
  after: {
    name: 'Conjured Diapers ++',
    sellIn: 0,
    quality: 36,
  },
};

// sellIn == 0 => sellIn is still 0
// quality 0 => quality is still 0

const conjuredNoSellInAndNoQuality = {
  before: {
    name: 'Conjured Diapers ++',
    sellIn: 0,
    quality: 0,
  },
  after: {
    name: 'Conjured Diapers ++',
    sellIn: 0,
    quality: 0,
  },
};

const mockEmptyItems = [];
const mockBeforeAfterItems = [
  defaultSellInAndQuality,
  defaultSellInAndNoQuality,
  defaultNoSellInAndQuality,
  defaultNoSellInAndNoQuality,
  brieSellInAndQuality,
  brieSellInAndTopQuality,
  brieNoSellInAndQuality,
  brieNoSellInAndTopQuality,
  sulfurasSellInAndQuality,
  backstageTopSellInAndQuality,
  backstageTopSellInAndTopQuality,
  backstageMidSellInAndQuality,
  backstageMidSellInAndLimitQuality,
  backstageMidSellInAndTopQuality,
  backstageLowSellInAndQuality,
  backstageLowSellInAndLimitQuality,
  backstageLowSellInAndTopQuality,
  backstageNoSellInAndNoQuality,
  conjuredSellInAndQuality,
  conjuredSellInAndNoQuality,
  conjuredNoSellInAndQuality,
  conjuredNoSellInAndNoQuality,
];

const beforeItems = mockBeforeAfterItems.map(({ before: { name, sellIn, quality } }) => new Item(name, sellIn, quality));
const afterItems = mockBeforeAfterItems.map(({ after: { name, sellIn, quality } }) => new Item(name, sellIn, quality));

describe("Gilded Rose", function() {
  it("should be able to process an empty list", () => {
    const gildedRose = new Shop(mockEmptyItems);
    const updatedItems = gildedRose.updateQuality();
    expect(updatedItems).toStrictEqual(mockEmptyItems);
  });
  it("should successfully update a list of valid items", () => {
    const gildedRose = new Shop(beforeItems);
    const updatedItems = gildedRose.updateQuality();
    updatedItems.forEach((updatedItem, index) => {
      expect(updatedItem.name).toBe(afterItems[index].name);
      expect(updatedItem.sellIn).toBe(afterItems[index].sellIn);
      expect(updatedItem.quality).toBe(afterItems[index].quality);
    });
  });
});
