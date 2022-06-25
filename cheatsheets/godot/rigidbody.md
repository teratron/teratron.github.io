# RigidBody

[Назад][back]

**Наследует:**
[PhysicsBody](physicsbody.md) **<** [CollisionObject](collisionobject.md) **<** [Spatial](spatial.md) **<** [Node](node.md) **<** [Object](object.md)

**Унаследовано:**
[VehicleBody](vehiclebody.md)

Физическое тело, положение которого определяется с помощью физического моделирования в 3D-пространстве.

## Описание

Это узел, который реализует полную 3D-физику. Это означает, что вы не управляете RigidBody напрямую. Вместо этого вы
можете применить к нему силы (гравитацию, импульсы и т. д.), а физическое моделирование рассчитает результирующее
движение, столкновение, отскок, вращение и т. д.

RigidBody имеет 4 [mode](#property-mode):

- Rigid (жесткий)
- Static (статический)
- Character (характерный)
- Kinematic (кинематический)

**Примечание:** Не меняйте положение RigidBody каждый кадр или очень часто. Спорадические изменения работают нормально,
но физика работает с другой степенью детализации (фиксированная Гц), чем обычный рендеринг (обратный вызов процесса) и,
возможно, даже в отдельном потоке, поэтому изменение этого из цикла процесса может привести к странному поведению. Если
вам нужно напрямую повлиять на состояние тела, используйте [\_integrate\_forces](#method-integrate-forces), который
позволяет вам напрямую получить доступ к физическому состоянию.

Если вам нужно переопределить поведение физики по умолчанию, вы можете написать пользовательскую функцию интеграции
силы. См. [custom_integrator](#property-custom-integrator).

С Bullet physics (по умолчанию) центром масс является центр RigidBody3D. В GodotPhysics центр масс - это
среднее [CollisionShape](collisionshape.md) центров формы столкновения.

## Свойства

| Тип | Свойство | По умолчанию |
| --- | --- | --- |
| [float](float.md) | [angular_damp](#property-angular-damp) | `-1.0` |
| [Vector3](vector3.md#vector3) | [angular_velocity](#property-angular-velocity) | `Vector3( 0, 0, 0 )` |
| [bool](bool.md) | [axis\_lock\_angular_x](#property-axis-lock-angular-x) | `false` |
| [bool](bool.md) | [axis\_lock\_angular_y](#property-axis-lock-angular-y) | `false` |
| [bool](bool.md) | [axis\_lock\_angular_z](#property-axis-lock-angular-z) | `false` |
| [bool](bool.md) | [axis\_lock\_linear_x](#property-axis-lock-linear-x) | `false` |
| [bool](bool.md) | [axis\_lock\_linear_y](#property-axis-lock-linear-y) | `false` |
| [bool](bool.md) | [axis\_lock\_linear_z](#property-axis-lock-linear-z) | `false` |
| [float](float.md) | [bounce](#property-bounce) |     |
| [bool](bool.md) | [can_sleep](#property-can-sleep) | `true` |
| [bool](bool.md) | [contact_monitor](#property-contact-monitor) | `false` |
| [int](int.md#int) | [contacts_reported](#property-contacts-reported) | `0` |
| [bool](bool.md) | [continuous_cd](#property-continuous-cd) | `false` |
| [bool](bool.md) | [custom_integrator](#property-custom-integrator) | `false` |
| [float](float.md) | [friction](#property-friction) |     |
| [float](float.md) | [gravity_scale](#property-gravity-scale) | `1.0` |
| [float](float.md) | [linear_damp](#property-linear-damp) | `-1.0` |
| [Vector3](vector3.md#vector3) | [linear_velocity](#property-linear-velocity) | `Vector3( 0, 0, 0 )` |
| [float](float.md) | [mass](#property-mass) | `1.0` |
| [Mode](#enum-rigidbody-mode) | [mode](#property-mode) | `0` |
| [PhysicsMaterial](physicsmaterial.md) | [physics\_material\_override](#property-physics-material-override) |     |
| [bool](bool.md) | [sleeping](#property-sleeping) | `false` |
| [float](float.md) | [weight](#property-weight) | `9.8` |

## Методы

| Тип | Метод |
| --- | --- |
| void | [\_integrate\_forces](#method-integrate-forces) **(** [PhysicsDirectBodyState](physicsdirectbodystate.md#physicsdirectbodystate) state **)** virtual |
| void | [add\_central\_force](#method-add-central-force) **(** [Vector3](vector3.md#vector3) force **)** |
| void | [add_force](#method-add-force) **(** [Vector3](vector3.md#vector3) force, [Vector3](vector3.md#vector3) position **)** |
| void | [add_torque](#method-add-torque) **(** [Vector3](vector3.md#vector3) torque **)** |
| void | [apply\_central\_impulse](#method-apply-central-impulse) **(** [Vector3](vector3.md#vector3) impulse **)** |
| void | [apply_impulse](#method-apply-impulse) **(** [Vector3](vector3.md#vector3) position, [Vector3](vector3.md#vector3) impulse **)** |
| void | [apply\_torque\_impulse](#method-apply-torque-impulse) **(** [Vector3](vector3.md#vector3) impulse **)** |
| [bool](bool.md) | [get\_axis\_lock](#method-get-axis-lock) **(** [BodyAxis](physicsserver.md#enum-physicsserver-bodyaxis) axis **)** const |
| [Array](array.md#array) | [get\_colliding\_bodies](#method-get-colliding-bodies) **(** **)** const |
| [Basis](basis.md#basis) | [get\_inverse\_inertia_tensor](#method-get-inverse-inertia-tensor) **(** **)** |
| void | [set\_axis\_lock](#method-set-axis-lock) **(** [BodyAxis](physicsserver.md#enum-physicsserver-bodyaxis) axis, [bool](bool.md) lock **)** |
| void | [set\_axis\_velocity](#method-set-axis-velocity) **(** [Vector3](vector3.md#vector3) axis_velocity **)** |

## Сигналы

**body_entered** **(** [Node](node.md) body **)**

Излучается при столкновении с другим [PhysicsBody](physicsbody.md) или [GridMap](gridmap.md). Требуется,
чтобы [contact_monitor](#property-contact-monitor) был установлен в `true`значение
и [contacts_reported](#property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения.
[GridMap](gridmap.md) обнаруживаются, если [MeshLibrary](meshlibrary.md) имеет [Shape](shape.md) столкновения.

`body` [Node](node.md), если он существует в дереве, другого [PhysicsBody](physicsbody.md) или [GridMap](gridmap.md).

***

**body_exited** **(** [Node](node.md) body **)**

Испускается, когда заканчивается столкновение с другим [PhysicsBody](physicsbody.md) или [GridMap](gridmap.md).
Требуется, чтобы [contact_monitor](#property-contact-monitor) был установлен в `true`значение
и [contacts_reported](#property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения.
[GridMap](gridmap.md) обнаруживаются, если [MeshLibrary](meshlibrary.md) имеет [Shape](shape.md) столкновения.

`body` [Node](node.md), если он существует в дереве, другого [PhysicsBody](physicsbody.md) или [GridMap](gridmap.md).

***

**body\_shape\_entered** **(** [RID](rid.md) body_rid, [Node](node.md) body, [int](int.md)
body\_shape\_index, [int](int.md) local\_shape\_index **)**

Испускается, когда одна из [Shapes](shape.md) этого твердого тела сталкивается с другой [PhysicsBody](physicsbody.md)
или [GridMap](gridmap.md) фигурой. Требуется, чтобы [contact_monitor](#property-contact-monitor) был установлен в `true`
значение и [contacts_reported](#property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все
столкновения.
[GridMap](gridmap.md) обнаруживаются, если [MeshLibrary](meshlibrary.md) имеет [Shape](shape.md) столкновения.

`body_rid` [избавление](rid.md) от другого [объекта](physicsbody.md physicsBody
или [MeshLibrary CollisionObject](meshlibrary.md)[,](collisionobject.md#collisionobject)
используемого [PhysicsServer](physicsserver.md).

`body` [Node](node.md), если он существует в дереве, другого [PhysicsBody](physicsbody.md) или [GridMap](gridmap.md).

`body_shape_index` индекс [формы](shape.md) другого [физического](physicsbody.md тела или [GridMap](gridmap.md),
используемого физическим [сервером](physicsserver.md). Получить [](collisionshape.md)
узел `body.shape_owner_get_owner(body_shape_index)` CollisionShape.

`local_shape_index` индекс [формы](shape.md) этого твердого тела, используемый
сервером [PhysicsServer](physicsserver.md). Получить [](collisionshape.md)
узел `self.shape_owner_get_owner(local_shape_index)` CollisionShape.

**Примечание:** Физика пули не может определить индекс формы при
использовании [ConcavePolygonShape](concavepolygonshape.md). Не используйте
несколько [CollisionShape](collisionshape.md) при использовании [ConcavePolygonShape](concavepolygonshape.md) с физикой
пули, если вам нужны индексы формы.

***

**body\_shape\_exited** **(** [RID](rid.md) body_rid, [Node](node.md) body, [int](int.md)
body\_shape\_index, [int](int.md) local\_shape\_index **)**

Испускается, когда заканчивается столкновение между одной из форм s этого твердого[тела](shape.md) и
другой [](physicsbody.md) [](gridmap.md) формой s physicsBody или GridMap[](shape.md).
Требуется [,](#property-contact-monitor) чтобы contact_monitor был установлен в `true`значение
и [contacts_reported](#property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения.
[GridMap](gridmap.md) обнаруживаются, если [MeshLibrary](meshlibrary.md) имеет [форму](shape.md) столкновения.

`body_rid` [избавление](rid.md#rid) от другого [объекта](physicsbody.md physicsBody
или [MeshLibrary CollisionObject](meshlibrary.md) [,](collisionobject.md#collisionobject)
используемого [PhysicsServer](physicsserver.md).
[GridMap](gridmap.md)s обнаруживаются, если сетки имеют [форму](shape.md).

`body` [узел](node.md), если он существует в дереве, другого [physicsBody](physicsbody.md) или [GridMap](gridmap.md).

`body_shape_index` индекс [формы](shape.md) другого [физического](physicsbody.md) тела или [GridMap](gridmap.md),
используемого физическим [сервером](physicsserver.md). Получить [](collisionshape.md)
узел `body.shape_owner_get_owner(body_shape_index)` CollisionShape.

`local_shape_index` индекс [формы](shape.md) этого твердого тела, используемый
сервером [PhysicsServer](physicsserver.md). Получить [](collisionshape.md)
узел `self.shape_owner_get_owner(local_shape_index)` CollisionShape.

**Примечание:** Физика пули не может определить индекс формы при
использовании [ConcavePolygonShape](concavepolygonshape.md). Не используйте
несколько [CollisionShape](collisionshape.md) при использовании [ConcavePolygonShape](concavepolygonshape.md) с физикой
пули, если вам нужны индексы формы.

***

**sleeping\_state\_changed** **(** **)**

Излучается, когда физический движок изменяет состояние сна тела.

**Примечание:** Изменение значения [Sleeping](#property-sleeping) не вызовет этот сигнал. Он излучается только в том
случае, если спящее состояние изменяется физическим движком или `emit_signal("sleeping_state_changed")` используется.

## Перечисления

**режим перечисления**:

**MODE_RIGID** = **0** - Режим жесткого тела. Это "естественное" состояние твердого тела. Он подвержен воздействию сил и
может перемещаться, вращаться и зависеть от кода пользователя.

**MODE_STATIC** = **1** - Статический режим. Тело ведет себя как [статическое](staticbody.md)тело и может перемещаться
только по пользовательскому коду.

**MODE_CHARACTER** = **2** - Режим тела персонажа. Это ведет себя как твердое тело, но не может вращаться.

**MODE_KINEMATIC** = **3** - Режим кинематического тела. Тело ведет себя как [кинематическое](kinematicbody.md)тело и
может двигаться только по пользовательскому коду.

## Описание свойств

[float](float.md) **angular_damp**

| _По умолчанию_ | `-1.0` |
| --- | --- |
| _Setter_ | set\_angular\_damp(value) |
| _Getter_ | get\_angular\_damp() |

Гасит вращательные силы RigidBody.

См. [ProjectSettings.physics/3d/default\_angular\_damp](projectsettings.md) для получения более подробной информации о
демпфировании.

***

[Vector3](vector3.md) **angular_velocity**

| _По умолчанию_ | `Vector3( 0, 0, 0 )` |
| --- | --- |
| _Setter_ | set\_angular\_velocity(value) |
| _Getter_ | get\_angular\_velocity() |

Скорость вращения тела в формате axis-angle.
Величина вектора-это скорость вращения в _радианах_ в секунду.

***

[bool](bool.md) **axis\_lock\_angular_x**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте вращение корпуса по оси X.

***

[bool](bool.md) **axis\_lock\_angular_y**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте вращение корпуса по оси Y.

***

[bool](bool.md) **axis\_lock\_angular_z**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте вращение тела по оси Z.

***

[bool](bool.md) **axis\_lock\_linear_x**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте движение тела по оси X.

***

[bool](bool.md) **axis\_lock\_linear_y**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте движение тела по оси Y.

***

[bool](bool.md) **axis\_lock\_linear_z**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте движение тела по оси Z.

***

[float](float.md) **bounce**

| _По умолчанию_ | `0.0` |
| --- | --- |
| _Setter_ | set_bounce(value) |
| _Getter_ | get_bounce() |

Упругость тела. Значения варьируются от `0` (no bounce) до `1` (full bounciness).
Устарело, используйте [PhysicsMaterial.bounce](physicsmaterial.md) вместо этого
через [physics\_material\_override](#property-physics-material-override).

***

[bool](bool.md) **can_sleep**

| _По умолчанию_ | `true` |
| --- | --- |
| _Setter_ | set\_can\_sleep(value) |
| _Getter_ | is\_able\_to_sleep() |

Если `true`тело может войти в спящий режим, когда нет движения. См. [sleeping](#property-sleeping).

**Примечание:** RigidBody3D никогда не войдет в спящий режим автоматически, если
его [mode](#property-mode) [MODE_CHARACTER](#constant-mode-character). Его все еще можно перевести в спящий режим
вручную, установив его [mode](#property-mode) свойство на `true`.

***

[bool](bool.md) **contact_monitor**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_contact\_monitor(value) |
| _Getter_ | is\_contact\_monitor_enabled() |

Если `true`, то RigidBody будет излучать сигналы при столкновении с другим RigidBody.
См. также [contacts_reported](#property-contacts-reported).

***

[int](int.md) **contacts_reported**

| _По умолчанию_ | `0` |
| --- | --- |
| _Setter_ | set\_max\_contacts_reported(value) |
| _Getter_ | get\_max\_contacts_reported() |

Максимальное количество контактов, которые будут записаны. Требуется, чтобы [contact_monitor](#property-contact-monitor)
был установлен в `true`.

**Примечание:** Количество контактов отличается от количества столкновений. Столкновения между параллельными ребрами
приведут к двум контактам (по одному на каждом конце), а столкновения между параллельными гранями приведут к четырем
контактам (по одному на каждом углу).

***

[bool](bool.md) **continuous_cd**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_use\_continuous\_collision\_detection(value) |
| _Getter_ | is\_using\_continuous\_collision\_detection() |

Если `true`используется непрерывное обнаружение столкновений.
Continuous collision detection пытается предсказать, где столкнется движущееся тело, вместо того, чтобы перемещать его и
корректировать его движение, если оно столкнулось.
Непрерывное обнаружение столкновений является более точным и пропускает меньше ударов маленькими, быстро движущимися
объектами.
Не используя непрерывное обнаружение столкновений быстрее вычислять, но может пропустить небольшие, быстро движущиеся
объекты.

***

[bool](bool.md) **custom_integrator**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set\_use\_custom_integrator(value) |
| _Getter_ | is\_using\_custom_integrator() |

Если значение `true`, интеграция внутренних сил будет отключена (например, гравитация или трение воздуха) для этого
тела. Помимо реакции на столкновение, тело будет перемещаться только так, как определено
функцией [\_integrate\_forces](#method-integrate-forces), если она определена.

***

[float](float.md) **friction**

| _По умолчанию_ | `1.0` |
| --- | --- |
| _Setter_ | set_friction(value) |
| _Getter_ | get_friction() |

Трение кузова, от 0 (без трения) до 1 (максимальное трение).

Устарело, используйте [PhysicsMaterial.friction](physicsmaterial.md-property-friction) вместо этого
через [physics\_material\_override](#property-physics-material-override).

***

[float](float.md) **gravity_scale**

| _По умолчанию_ | `1.0` |
| --- | --- |
| _Setter_ | set\_gravity\_scale(value) |
| _Getter_ | get\_gravity\_scale() |

Это умножается на глобальную настройку 3D gravity, найденную в **Project > Project Settings > Physics > 3d** для
создания гравитации RigidBody.
Например, значение 1 будет нормальной гравитацией, 2 будет применять двойную гравитацию, а 0.5 будет применять половину
гравитации к этому объекту.

***

[float](float.md) **linear_damp**

| _По умолчанию_ | `-1.0` |
| --- | --- |
| _Setter_ | set\_linear\_damp(value) |
| _Getter_ | get\_linear\_damp() |

Линейная влажность тела. Не может быть меньше -1.0.
Если это значение отличается от -1.0, любая линейная влажность, полученная из мира или областей, будет переопределена.

См. [ProjectSettings.physics/3d/default\_linear\_damp](projectsettings.md) для получения более подробной информации о
демпфировании.

***

[Vector3](vector3.md) **linear_velocity**

| _По умолчанию_ | `Vector3( 0, 0, 0 )` |
| --- | --- |
| _Setter_ | set\_linear\_velocity(value) |
| _Getter_ | get\_linear\_velocity() |

Линейная скорость тела в единицах в секунду. Может использоваться спорадически, но **не устанавливайте это каждый кадр**
, потому что физика может работать в другом потоке и работать с другой степенью детализации.
Используйте [\_integrate\_forces](#method-integrate-forces) в качестве технологического цикла для точного контроля
состояния тела.

***

[float](float.md) **mass**

| _По умолчанию_ | `1.0` |
| --- | --- |
| _Setter_ | set_mass(value) |
| _Getter_ | get_mass() |

Масса тела.

***

[Mode](#enum-rigidbody-mode) **mode**

| _По умолчанию_ | `0` |
| --- | --- |
| _Setter_ | set_mode(value) |
| _Getter_ | get_mode() |

Возможные значения см. [Mode](#enum-rigidbody-mode).

***

[PhysicsMaterial](physicsmaterial.md) **physics\_material\_override**

| _По умолчанию_ | null |
| --- | --- |
| _Setter_ | set\_physics\_material_override(value) |
| _Getter_ | get\_physics\_material_override() |

Переопределение физического материала для тела.
Если материалу присвоено это свойство, он будет использоваться вместо любого другого физического материала, например
унаследованного.

***

[bool](bool.md) **sleeping**

| _По умолчанию_ | `false` |
| --- | --- |
| _Setter_ | set_sleeping(value) |
| _Getter_ | is_sleeping() |

Если `true`тело не будет двигаться и не будет вычислять силы, пока его не разбудит другое тело, например, при
столкновении, или с помощью методов [apply_impulse](#method-apply-impulse) или [add_force](#method-add-force).

***

[float](float.md) **weight**

| _По умолчанию_ | `9.8` |
| --- | --- |
| _Setter_ | set_weight(value) |
| _Getter_ | get_weight() |

Вес тела, основанный на его массе и глобальной 3D-гравитации. Глобальные значения задаются в **Project > Project
Settings > Physics > 3d**.

## Описание метода

void **\_integrate\_forces** **(** [PhysicsDirectBodyState](physicsdirectbodystate.md) state **)** virtual

Вызывается во время обработки физики, позволяя считывать и безопасно изменять состояние моделирования для объекта. По
умолчанию он работает в дополнение к обычному физическому поведению, но
свойство [custom_integrator](#property-custom-integrator) позволяет отключить поведение по умолчанию и полностью
настроить интеграцию силы для тела.

***

void **add\_central\_force** **(** [Vector3](vector3.md) force **)**

Добавляет постоянную направленную силу (т. е. Ускорение), не влияя на вращение. Это
эквивалентно `add_force(force, Vector3(0,0,0))`.

***

void **add_force** **(** [Vector3](vector3.md) force, [Vector3](vector3.md) position **)**

Добавляет постоянную направленную силу (т. е. Ускорение).
Позиция использует вращение глобальной системы координат, но центрируется в начале координат объекта.

***

void **add_torque** **(** [Vector3](vector3.md) torque **)**

Добавляет постоянную вращательную силу (т. е. двигатель), не влияя на положение.

***

void **apply\_central\_impulse** **(** [Vector3](vector3.md) impulse **)**

Применяет направленный импульс, не влияя на вращение.
Это эквивалентно `apply_impulse(Vector3(0,0,0), impulse)`.

***

void **apply_impulse** **(** [Vector3](vector3.md) position, [Vector3](vector3.md) impulse **)**

Прикладывает позиционированный импульс к корпусу. Импульс не зависит от времени!
Применение импульса к каждому кадру приведет к силе, зависящей от частоты кадров. По этой причине его следует
использовать только при моделировании одноразовых воздействий. Позиция использует вращение глобальной системы координат,
но центрируется в начале координат объекта.

***

void **apply\_torque\_impulse** **(** [Vector3](vector3.md) impulse **)**

Применяет импульс крутящего момента, который будет зависеть от массы и формы тела. Это будет вращать тело
вокруг `impulse`переданного вектора.

***

[bool](bool.md) **get\_axis\_lock** **(** [BodyAxis](physicsserver.md#enum-physicsserver-bodyaxis) axis **)** const

Возвращает`true`, если заданная линейная или вращательная ось заблокирована.

***

[Array](array.md) **get\_colliding\_bodies** **(** **)** const

Возвращает список тел, сталкивающихся с этим. Требуется, чтобы [contact_monitor](#property-contact-monitor) был
установлен в `true` значение и [contacts_reported](#property-contacts-reported) был установлен достаточно высоко, чтобы
обнаружить все столкновения.

**Примечание:** Результат этого теста не сразу после перемещения объектов. Для производительности список столкновений
обновляется один раз за кадр и перед шагом физики. Вместо этого рассмотрите возможность использования сигналов.

***

[Basis](basis.md#basis) **get\_inverse\_inertia_tensor** **(** **)**

Возвращает базис обратного тензора инерции.
Это используется для расчета углового ускорения, возникающего в результате крутящего момента, приложенного к жесткому
телу.

***

void **set\_axis\_lock** **(** [BodyAxis](physicsserver.md#enum-physicsserver-bodyaxis) axis, [bool](bool.md) lock **)**

Фиксирует указанную линейную или вращательную ось.

***

void **set\_axis\_velocity** **(** [Vector3](vector3.md) axis_velocity **)**

Устанавливает скорость оси. Скорость на заданной векторной оси будет установлена как заданная длина вектора. Это полезно
для прыжкового поведения.

[Назад][back]

[back]: <.> "Назад к оглавлению"