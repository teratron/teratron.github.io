# Benchmark

← [Назад][back]

---

```mojo
from benchmark import run, Unit
from time import sleep

fn sleeper():
    sleep(0.01)

fn main():
    let report = run[sleeper]()
    print(report.mean())  # 0.010166589737226277
    report.print()
    report.print[Unit.ms]()

# ---------------------
# Benchmark Report (s)
# ---------------------
# Mean: 0.010166589737226277
# Total: 1.392822794
# Iters: 137
# Warmup Mean: 0.010188247500000001
# Warmup Total: 0.020376495000000001
# Warmup Iters: 2
# Fastest Mean: 0.01016483593220339
# Slowest Mean: 0.0101734306

# ---------------------
# Benchmark Report (ms)
# ---------------------
# Mean: 10.166589737226277
# Total: 1392.8227939999999
# Iters: 137
# Warmup Mean: 10.188247499999999
# Warmup Total: 20.376494999999998
# Warmup Iters: 2
# Fastest Mean: 10.16483593220339
# Slowest Mean: 10.1734306
```

```mojo

```

```mojo

```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"