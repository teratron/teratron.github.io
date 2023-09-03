# Lifetime

[Назад][back]

## Время жизни ссылки

### Struct Lifetimes

```rust
struct C;

struct B<'b> {
    c: &'b C,
}

struct A<'a> {
    b: B<'a>,
    c: &'a C
}

fn main() {
    let c1 = C;
    let _ = A::new(&c1);
}

impl<'a> A<'a> {
    fn new(c: &'a C) -> A<'a> {
        A {c: c, b: B{c: c}}
    }
}
```

```rust
#[derive(Debug)]
struct BaseDimension {
    length: u32,
    breadth: u32
}

#[derive(Debug)]
enum Colour { R, G, B }

#[derive(Debug)]
struct Tank<'base> {
    colour: Colour,
    base: &'base BaseDimension
}

fn main() {
    let base20x40 = BaseDimension { length: 20, breadth: 40 };
    let tank20x40 = Tank { colour: Colour::R, base: &base20x40};
    
    println!("{:?}", tank20x40);
    println!("{:?}", base20x40);
}
```

### Function Lifetimes

```rust
#[derive(Debug)]
struct City {
    name: String,
    country: String,
    continent: String,
}

#[derive(Debug)]
struct Hospital<'city> {
    name: String,
    location: &'city City
}

fn healthcare_centres<'h, 'city>(hosp: &'h Hospital<'city>, city: &'city City) -> (&'h Hospital<'city>, &'city City) {
    (hosp, city)
}

fn main() {
    let kd = City {
        name: "Kaduna".to_string(), 
        country: "NGA".to_string(), 
        continent: "Africa".to_string(), 
    };
    let saints_hosp = Hospital {
        name: "Saints Hospital".to_string(),
        location: &kd,
    };
    let hc = healthcare_centres(&saints_hosp, &kd);
    
    println!("{:#?}", hc);
    println!("{:#?}", saints_hosp); 
    println!("{:#?}", kd);   
}
```

```rust

```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"