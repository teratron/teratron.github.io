# for

← [Назад][back]

## Перебор элементов итератора, реализация типажа или указание срока жизни

```rust
for num in 1..6 {
    println!("num = {}", num);
}
```

```rust
for i in 1..10 {
    for j in 1..10 {
        print!("{}\t", i * j);
    }
    println!();
}
```

```rust
for _ in 0..10 {
    println!("Hello");
}

// или

print!("{}", "Hello\n".repeat(10));
```

```rust
for x in items {
	do_something(x);
}

// или

items.into_iter().for_each(|x| do_something(x));
```

```rust
for (i, x) in items.iter().enumerate() {
    println!("Item {} = {}", i, x);
}

// или

items.iter().enumerate().for_each(|(i, x)| {
    println!("Item {} = {}", i, x);
})
```

```rust
for (k, x) in &mymap {
    println!("Key={key}, Value={val}", key=k, val=x);
}
```

```rust
'outer: for va in &a {
    for vb in &b {
        if va == vb {
            continue 'outer;
        }
    }
    println!("{}", va);
}
```

```rust
'outer: for v in m {
    'inner: for i in v {
        if i < 0 {
            println!("Found {}", i);
            break 'outer;
        }
    }
}
```

```rust

```

```rust

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"
