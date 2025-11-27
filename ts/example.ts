class Bear {
    sound() {
        console.log('ROAR!');
    }
}
class Duck {
    sound() {
        console.log('QUACK!');
    }
}

function emitSound({ sound }: { sound(): void }) {
    sound();
}

emitSound(new Bear());
emitSound(new Duck());