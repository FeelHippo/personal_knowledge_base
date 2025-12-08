interface abstraction {
    addProperty(id: string, data: any): Promise<void>;
}

class implementation implements abstraction {
    async addProperty(id: string, data: any): Promise<void> {
        return Promise.resolve();
    }
}

class parent {
    printSomething(): void {
        console.log('something');
    }
}

class child extends parent {
    constructor() {
        super();
        this.printSomething();
    }
}

new child().printSomething();