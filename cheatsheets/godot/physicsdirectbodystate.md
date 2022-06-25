# PhysicsDirectBodyState

**Наследует:** [Объект](class_object.md#class-object)

Объект прямого доступа к физическому телу в [PhysicsServer](class_physicsserver.md#class-physicsserver).

## Описание

Обеспечивает прямой доступ к физическому телу на [физическом сервере](class_physicsserver.md#class-physicsserver),
позволяя безопасно изменять физические свойства. Этот объект передается через прямой обратный вызов состояния
жестких/символьных тел и предназначен для изменения прямого состояния этого тела.
См[. RigidBody.\_integrate_forces](class_rigidbody.md#class-rigidbody-method-integrate-forces).

## Руководства[¶](#tutorials "Постоянная ссылка на этот заголовок")

[Введение в физику](../tutorials/physics/physics_introduction.md)
[Ray-casting](../tutorials/physics/ray-casting.md)

## Свойства[¶](#properties "Постоянная ссылка на этот заголовок")

|                                      |                                                                                         |
|--------------------------------------|-----------------------------------------------------------------------------------------|
| [Vector3](class_vector3.md)          | [angular_velocity](#class-physicsdirectbodystate-property-angular-velocity)             |
| [Vector3](class_vector3.md)          | [center_of_mass](#class-physicsdirectbodystate-property-center-of-mass)                 |
| [Vector3](class_vector3.md)          | [inverse_inertia](#class-physicsdirectbodystate-property-inverse-inertia)               |
| [float](class_float.md)              | [inverse_mass](#class-physicsdirectbodystate-property-inverse-mass)                     |
| [Vector3](class_vector3.md)          | [linear_velocity](#class-physicsdirectbodystate-property-linear-velocity)               |
| [Основа](class_basis.md)             | [principal_inertia_axes](#class-physicsdirectbodystate-property-principal-inertia-axes) |
| [bool](class_bool.md#class-bool)     | [Спящие](#class-physicsdirectbodystate-property-sleeping)                               |
| [float](class_float.md)              | [шаг](#class-physicsdirectbodystate-property-step)                                      |
| [float](class_float.md)              | [total_angular_damp](#class-physicsdirectbodystate-property-total-angular-damp)         |
| [Vector3](class_vector3.md)          | [total_gravity](#class-physicsdirectbodystate-property-total-gravity)                   |
| [float](class_float.md)              | [total_linear_damp](#class-physicsdirectbodystate-property-total-linear-damp)           |
| [Преобразование](class_transform.md) | [преобразование](#class-physicsdirectbodystate-property-transform)                      |

## Методы[¶](#methods "Постоянная ссылка на этот заголовок")

|                                                                                           |                                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| void                                                                                      | [add_central_force](#class-physicsdirectbodystate-method-add-central-force) **(** [Vector3](class_vector3.md) force **)**                                                               |
| void                                                                                      | [add_force](#class-physicsdirectbodystate-method-add-force) **(** [Vector3](class_vector3.md) force, [Vector3](class_vector3.md) position **)**                                         |
| void                                                                                      | [add_torque](#class-physicsdirectbodystate-method-add-torque) **(** [Vector3](class_vector3.md) torque **)**                                                                            |
| void                                                                                      | [apply_central_impulse](#class-physicsdirectbodystate-method-apply-central-impulse) **(** [Vector3](class_vector3.md) j **)**                                                           |
| void                                                                                      | [apply_impulse](#class-physicsdirectbodystate-method-apply-impulse) **(** [Vector3](class_vector3.md) position, [Vector3](class_vector3.md) j **)**                                     |
| void                                                                                      | [apply_torque_impulse](#class-physicsdirectbodystate-method-apply-torque-impulse) **(** [Vector3](class_vector3.md) j **)**                                                             |
| [RID](class_rid.md#class-rid)                                                             | [get_contact_collider](#class-physicsdirectbodystate-method-get-contact-collider) **(** [int](class_int.md#class-int) contact_idx **)** const                                           |
| [int](class_int.md#class-int)                                                             | [get_contact_collider_id](#class-physicsdirectbodystate-method-get-contact-collider-id) **(** [int](class_int.md#class-int) contact_idx **)** const                                     |
| [Объект](class_object.md#class-object)                                                    | [get_contact_collider_object](#class-physicsdirectbodystate-method-get-contact-collider-object) **(** [int](class_int.md#class-int) contact_idx **)** const                             |
| [Vector3](class_vector3.md)                                                               | [get_contact_collider_position](#class-physicsdirectbodystate-method-get-contact-collider-position) **(** [int](class_int.md#class-int) contact_idx **)** const                         |
| [int](class_int.md#class-int)                                                             | [get_contact_collider_shape](#class-physicsdirectbodystate-method-get-contact-collider-shape) **(** [int](class_int.md#class-int) contact_idx **)** const                               |
| [Vector3](class_vector3.md)                                                               | [get_contact_collider_velocity_at_position](#class-physicsdirectbodystate-method-get-contact-collider-velocity-at-position) **(** [int](class_int.md#class-int) contact_idx **)** const |
| [int](class_int.md#class-int)                                                             | [get_contact_count](#class-physicsdirectbodystate-method-get-contact-count) **(** **)** const                                                                                           |
| [float](class_float.md)                                                                   | [get_contact_impulse](#class-physicsdirectbodystate-method-get-contact-impulse) **(** [int](class_int.md#class-int) contact_idx **)** const                                             |
| [Vector3](class_vector3.md)                                                               | [get_contact_local_normal](#class-physicsdirectbodystate-method-get-contact-local-normal) **(** [int](class_int.md#class-int) contact_idx **)** const                                   |
| [Vector3](class_vector3.md)                                                               | [get_contact_local_position](#class-physicsdirectbodystate-method-get-contact-local-position) **(** [int](class_int.md#class-int) contact_idx **)** const                               |
| [int](class_int.md#class-int)                                                             | [get_contact_local_shape](#class-physicsdirectbodystate-method-get-contact-local-shape) **(** [int](class_int.md#class-int) contact_idx **)** const                                     |
| [PhysicsDirectSpaceState](class_physicsdirectspacestate.md#class-physicsdirectspacestate) | [get_space_state](#class-physicsdirectbodystate-method-get-space-state) **(** **)**                                                                                                     |
| [Vector3](class_vector3.md)                                                               | [get_velocity_at_local_position](#class-physicsdirectbodystate-method-get-velocity-at-local-position) **(** [Vector3](class_vector3.md) local_position **)** const                      |
| void                                                                                      | [integrate_forces](#class-physicsdirectbodystate-method-integrate-forces) **(** **)**                                                                                                   |

## Описание свойств[¶](#property-descriptions "Постоянная ссылка на этот заголовок")

[Vector3](class_vector3.md) **angular_velocity**

|          |                                |
|----------|--------------------------------|
| _Сеттер_ | set_angular_velocity(значение) |
| _Геттер_ | get_angular_velocity()         |

Скорость вращения тела в формате axis-angle. Величина вектора-это скорость вращения в _радианах_ в секунду.

---

[Vector3](class_vector3.md) **center_of_mass**

|          |                      |
|----------|----------------------|
| _Геттер_ | get_center_of_mass() |

---

[Vector3](class_vector3.md) **inverse_inertia**

|          |                       |
|----------|-----------------------|
| _Геттер_ | get_inverse_inertia() |

Обратная величина инерции тела.

---

[float](class_float.md) **inverse_mass**

|          |                    |
|----------|--------------------|
| _Геттер_ | get_inverse_mass() |

Обратная масса тела.

---

[Vector3](class_vector3.md) **linear_velocity**

|          |                               |
|----------|-------------------------------|
| _Сеттер_ | set_linear_velocity(значение) |
| _Геттер_ | get_linear_velocity()         |

Линейная скорость тела в единицах в секунду.

---

[Basis](class_basis.md **principal_inertia_axes**

|          |                              |
|----------|------------------------------|
| _Геттер_ | get_principal_inertia_axes() |

---

[bool](class_bool.md#class-bool) **sleeping**

|          |                           |
|----------|---------------------------|
| _Сеттер_ | set_sleep_state(значение) |
| _Геттер_ | is_sleeping()             |

Если `true`это тело в данный момент спит (не активно).

---

[float](class_float.md) **step**

|          |            |
|----------|------------|
| _Геттер_ | get_step() |

Временной шаг (дельта), используемый для моделирования.

---

[float](class_float.md) **total_angular_damp**

|          |                          |
|----------|--------------------------|
| _Геттер_ | get_total_angular_damp() |

Скорость, с которой тело перестает вращаться, если нет никаких других сил, движущих его.

---

[Vector3](class_vector3.md) **total_gravity**

|          |                     |
|----------|---------------------|
| _Геттер_ | get_total_gravity() |

Вектор полной гравитации, применяемый в настоящее время к этому телу.

---

[float](class_float.md) **total_linear_damp**

|          |                         |
|----------|-------------------------|
| _Геттер_ | get_total_linear_damp() |

Скорость, с которой тело перестает двигаться, если его не двигают никакие другие силы.

---

[Transform](class_transform.md) **transform**

|          |                         |
|----------|-------------------------|
| _Сеттер_ | set_transform(значение) |
| _Геттер_ | get_transform()         |

Матрица преобразования тела.

## Описание метода[¶](#method-descriptions "Постоянная ссылка на этот заголовок")

- void **add_central_force** **(** [Vector3](class_vector3.md) force **)**

Добавляет постоянную направленную силу, не влияя на вращение.

Это эквивалентно `add_force(force, Vector3(0,0,0))`.

---

- void **add_force** **(** [Vector3](class_vector3.md) force, [Vector3](class_vector3.md) position **)**

Добавляет позиционируемую силу к телу. И сила, и смещение от начала координат тела находятся в глобальных координатах.

---

- void **add_torque** **(** [Vector3](class_vector3.md) torque **)**

Добавляет постоянную вращательную силу, не влияя на положение.

---

- void **apply_central_impulse** **(** [Vector3](class_vector3.md) j **)**

Применяет один направленный импульс, не влияя на вращение.

Это эквивалентно `apply_impulse(Vector3(0, 0, 0), impulse)`.

---

- void **apply_impulse** **(** [Vector3](class_vector3.md) position, [Vector3](class_vector3.md) j **)**

Применяет позиционированный импульс к телу. Импульс не зависит от времени! Применение импульса к каждому кадру приведет
к силе, зависящей от частоты кадров. По этой причине его следует использовать только при моделировании одноразовых
воздействий. Позиция использует вращение глобальной системы координат, но центрируется в начале координат объекта.

---

- void **apply_torque_impulse** **(** [Vector3](class_vector3.md) j **)**

Примените импульс крутящего момента (который будет зависеть от массы и формы тела). Это будет вращать тело вокруг
вектора`j`, переданного в качестве параметра.

---

[RID](class_rid.md#class-rid) **get_contact_collider** **(** [int](class_int.md#class-int) contact_idx **)** const

Возвращает [RID коллайдера](class_rid.md#class-rid).

---

[int](class_int.md#class-int) **get_contact_collider_id** **(** [int](class_int.md#class-int) contact_idx **)** const

Возвращает идентификатор объекта коллайдера.

---

[Объект](class_object.md#class-object) **get_contact_collider_object** **(** [int](class_int.md#class-int)
contact_idx **)** const

Возвращает объект collider.

---

[Vector3](class_vector3.md) **get_contact_collider_position** **(** [int](class_int.md#class-int) contact_idx **)**
const

Возвращает положение контакта в коллайдере.

---

[int](class_int.md#class-int) **get_contact_collider_shape** **(** [int](class_int.md#class-int) contact_idx **)** const

Возвращает индекс формы коллайдера.

---

[Vector3](class_vector3.md) **get_contact_collider_velocity_at_position** **(** [int](class_int.md#class-int)
contact_idx **)** const

Возвращает вектор линейной скорости в точке контакта коллайдера.

---

[int](class_int.md#class-int) **get_contact_count** **(** **)** const

Возвращает количество контактов этого тела с другими телами.

**Примечание:** По умолчанию возвращается 0, если тела не настроены для мониторинга контактов.
См[. RigidBody.contact_monitor](class_rigidbody.md#class-rigidbody-property-contact-monitor).

---

[float](class_float.md) **get_contact_impulse** **(** [int](class_int.md#class-int) contact_idx **)** const

Импульс, созданный контактом. Реализовано только для физики пули.

---

[Vector3](class_vector3.md) **get_contact_local_normal** **(** [int](class_int.md#class-int) contact_idx **)** const

Возвращает локальную нормаль в точке контакта.

---

[Vector3](class_vector3.md) **get_contact_local_position** **(** [int](class_int.md#class-int) contact_idx **)** const

Возвращает локальное положение точки контакта.

---

[int](class_int.md#class-int) **get_contact_local_shape** **(** [int](class_int.md#class-int) contact_idx **)** const

Возвращает локальный индекс формы столкновения.

---

[PhysicsDirectSpaceState](class_physicsdirectspacestate.md#class-physicsdirectspacestate) **
get_space_state** **(** **)**

Возвращает текущее состояние пространства, полезное для запросов.

---

[Vector3](class_vector3.md) **get_velocity_at_local_position** **(** [Vector3](class_vector3.md) local_position **)**
const

Возвращает скорость тела в заданном относительном положении, включая как перевод, так и вращение.

---

- void **integrate_forces** **(** **)**

Вызывает встроенный код интеграции force.
