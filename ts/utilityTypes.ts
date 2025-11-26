export {};

// https://www.typescriptlang.org/docs/handbook/utility-types.html#picktype-keys

// Awaited<Type>
// models async operations, results in the eventual type
type A = Awaited<Promise<string>>; // type A = string

const asyncFunction = (s: string) => Promise.resolve(s);
const asyncFunctionResult: A = await asyncFunction('Hello');

type B = Awaited<Promise<Promise<number>>>;
const anotherAsyncFunction = (s: string) => Promise.resolve(parseInt(s));
const anotherAsyncFunctionResult: B = await anotherAsyncFunction(await asyncFunction('1'));

type C = Awaited<boolean | Promise<number>>;
const errorHandlingAsyncFunction = (s: string) => {
    try {
        return anotherAsyncFunction(s);
    } catch (e) {
        return false;
    }
};
const errorHandlingAsyncFunctionResult: C = await errorHandlingAsyncFunction('WRONG');

// Partial<Type>
// Constructs a type with all properties of Type set to optional.
interface Car {
    brand: string;
    year: number;
    registered: boolean;
}

const newCar: Car = {
    brand: 'Land Rover',
    year: 2010,
    registered: false,
}

const modifyCar = (newCar: Car, data: Partial<Car>): Car => {
    return { ...newCar, ...data };
}

const registeredCar = modifyCar(newCar, { registered: true });

// Required<Type>
// Constructs a type consisting of all properties of Type set to required
interface FeeFiFoFum {
    fee?: string;
    fi?: number;
    fo?:boolean;
    fum?: FeeFiFoFum;
}

const thisIsOk: FeeFiFoFum = {}
const thisIsNotOk: Required<FeeFiFoFum> = {} // TS2739: Type {} is missing the following properties from type Required<FeeFiFoFum>: fee, fi, fo, fum
const thisIsOkNow: Required<FeeFiFoFum> = {
    fee: 'Fee',
    fi: 1,
    fo: true,
    fum: {}
}

// Readonly<Type>
// the properties of the constructed type cannot be reassigned
interface ToldInStone {
    doAsTheRomans: boolean;
}

const ave: Readonly<ToldInStone> = {
    doAsTheRomans: true,
}

ave.doAsTheRomans = false; // Attempt to assign to const or readonly variable

// Record<Keys, Type>
// Constructs an object type whose property keys are Keys and whose property values are Type

type Platform = 'iOs' | 'Android' | 'Windows' | 'Linux';

interface Info {
    implemented: boolean;
    url?: string;
}

const applications: Record<Platform, Info> = {
    iOs: { implemented: true, url: 'https://apple.store.com' },
    Android: { implemented: true, url: 'https://play.store.com' },
    Windows: { implemented: true },
    Linux: { implemented: false },
}

applications.Android;

// Pick<Type, Keys>
// Constructs a type by picking the set of properties Keys (string literal or union of string literals) from Type
interface Clothing {
    hat: string;
    shirt: string;
    trousers: string;
    shoes: string;
}

type BottomClothing = Pick<Clothing, 'trousers' | 'shoes'>;

const whatIAmWearing: BottomClothing = {
    trousers: 'blue',
    shoes: 'red',
}

// Omit<Type, Keys>
// Constructs a type by picking all properties from Type and then removing Keys (string literal or union of string literals).
// The opposite of Pick

type TopClothing = Omit<Clothing, 'trousers' | 'shoes'>;

const whatIAmWearingNow: TopClothing = {
    hat: 'blue',
    shirt: 'red',
}

// Exclude<UnionType, ExcludedMembers>
// Constructs a type by excluding from UnionType all union members that are assignable to ExcludedMembers

type Shape =
    | { kind: "circle"; radius: number }
    | { kind: "square"; x: number }
    | { kind: "triangle"; x: number; y: number };

type Included = Exclude<Shape, { kind: "circle" }> // {kind: "square", x: number} | {kind: "triangle", x: number, y: number}

// Extract<Type, Union>
// Constructs a type by extracting from Type all union members that are assignable to Union

type Extracted = Extract<Shape, { kind: "circle" }> // {kind: "circle", radius: number}

// NonNullable<Type>
// Constructs a type by excluding null and undefined from Type

type NoneOfTheseIsNullOrUndefined = NonNullable<string | number | boolean | null | undefined>; // string | number | boolean

// Parameters<Type>
// Constructs a tuple type from the types used in the parameters of a function type "Type"

type functionWithoutArguments = Parameters<() => string>; // []

type functionWithOneParameter = Parameters<(s: string) => string>; // [s: string]

type functionWithGenericType = Parameters<<T>(arg: T) => string>; // [arg: T]

declare function myFunction(arg: { a: number; b: string }): string;

type functionWithParameters = Parameters<typeof myFunction>; // [arg: {a: number, b: string}]

// ReturnType<Type>
// Constructs a type consisting of the return type of function Type

type functionWithParametersReturnType = ReturnType<typeof myFunction>; // string

// InstanceType<Type>
// Constructs a type consisting of the instance type of a constructor function in Type

class Manufacturer {
    name = 'Toyota';
}

type Toyota = InstanceType<typeof Manufacturer>; // Manufacturer

class Model extends Manufacturer {}

type Yaris = InstanceType<typeof Model>; // Model


