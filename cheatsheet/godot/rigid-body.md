RigidBody[¶](#rigidbody "Постоянная ссылка на этот заголовок")
==============================================================

**Наследует:** [physicsBody](class_physicsbody.html#class-physicsbody) **<** [CollisionObject](class_collisionobject.html#class-collisionobject) **<** [Пространственное](class_spatial.html#class-spatial) **<** [Узел](class_node.html#class-node) **<** [Объект](class_object.html#class-object)

**Унаследовано:** [VehicleBody](class_vehiclebody.html#class-vehiclebody)

Физическое тело, положение которого определяется с помощью физического моделирования в 3D-пространстве.

Описание[¶](#description "Постоянная ссылка на этот заголовок")
---------------------------------------------------------------

Это узел, который реализует полную 3D-физику. Это означает, что вы не управляете RigidBody напрямую. Вместо этого вы можете применить к нему силы (гравитацию, импульсы и т. Д.), А физическое моделирование рассчитает результирующее движение, столкновение, отскок, вращение и т. Д.

Жесткое тело имеет 4 [режима поведения](#class-rigidbody-property-mode): жесткий, статический, характерный и кинематический.

**Примечание:** Не меняйте положение RigidBody каждый кадр или очень часто. Спорадические изменения работают нормально, но физика работает с другой степенью детализации (фиксированная Гц), чем обычный рендеринг (обратный вызов процесса) и, возможно, даже в отдельном потоке, поэтому изменение этого из цикла процесса может привести к странному поведению. Если вам нужно напрямую повлиять на состояние тела, используйте [\_integrate\_forces](#class-rigidbody-method-integrate-forces), который позволяет вам напрямую получить доступ к физическому состоянию.

Если вам нужно переопределить поведение физики по умолчанию, вы можете написать пользовательскую функцию интеграции силы. См[. custom_integrator](#class-rigidbody-property-custom-integrator).

С Bullet physics (по умолчанию) центром масс является центр RigidBody3D. В GodotPhysics центр масс-это среднее [значение](class_collisionshape.html#class-collisionshape) центров формы столкновения.

Руководства[¶](#tutorials "Постоянная ссылка на этот заголовок")
----------------------------------------------------------------

* [Введение в физику](../tutorials/physics/physics_introduction.html)

* [3D Truck Town Demo](https://godotengine.org/asset-library/asset/524)

* [3D Физические тесты Демо](https://godotengine.org/asset-library/asset/675)


Свойства[¶](#properties "Постоянная ссылка на этот заголовок")
--------------------------------------------------------------

|     |     |     |
| --- | --- | --- |
| [float](class_float.html#class-float) | [angular_damp](#class-rigidbody-property-angular-damp) | `-1.0` |
| [Vector3](class_vector3.html#class-vector3) | [angular_velocity](#class-rigidbody-property-angular-velocity) | `Vector3( 0, 0, 0 )` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_angular_x](#class-rigidbody-property-axis-lock-angular-x) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_angular_y](#class-rigidbody-property-axis-lock-angular-y) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_angular_z](#class-rigidbody-property-axis-lock-angular-z) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_linear_x](#class-rigidbody-property-axis-lock-linear-x) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_linear_y](#class-rigidbody-property-axis-lock-linear-y) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_linear_z](#class-rigidbody-property-axis-lock-linear-z) | `false` |
| [float](class_float.html#class-float) | [bounce](#class-rigidbody-property-bounce) |     |
| [bool](class_bool.html#class-bool) | [can_sleep](#class-rigidbody-property-can-sleep) | `true` |
| [bool](class_bool.html#class-bool) | [contact_monitor](#class-rigidbody-property-contact-monitor) | `false` |
| [int](class_int.html#class-int) | [contacts_reported](#class-rigidbody-property-contacts-reported) | `0` |
| [bool](class_bool.html#class-bool) | [continuous_cd](#class-rigidbody-property-continuous-cd) | `false` |
| [bool](class_bool.html#class-bool) | [custom_integrator](#class-rigidbody-property-custom-integrator) | `false` |
| [float](class_float.html#class-float) | [трение](#class-rigidbody-property-friction) |     |
| [float](class_float.html#class-float) | [gravity_scale](#class-rigidbody-property-gravity-scale) | `1.0` |
| [float](class_float.html#class-float) | [linear_damp](#class-rigidbody-property-linear-damp) | `-1.0` |
| [Vector3](class_vector3.html#class-vector3) | [linear_velocity](#class-rigidbody-property-linear-velocity) | `Vector3( 0, 0, 0 )` |
| [float](class_float.html#class-float) | [масса](#class-rigidbody-property-mass) | `1.0` |
| [Режим](#enum-rigidbody-mode) | [режим](#class-rigidbody-property-mode) | `0` |
| [PhysicsMaterial](class_physicsmaterial.html#class-physicsmaterial) | [physics\_material\_override](#class-rigidbody-property-physics-material-override) |     |
| [bool](class_bool.html#class-bool) | [Спящие](#class-rigidbody-property-sleeping) | `false` |
| [float](class_float.html#class-float) | [вес](#class-rigidbody-property-weight) | `9.8` |

Методы[¶](#methods "Постоянная ссылка на этот заголовок")
---------------------------------------------------------

|     |     |
| --- | --- |
| void | [\_integrate\_forces](#class-rigidbody-method-integrate-forces) **(** [PhysicsDirectBodyState](class_physicsdirectbodystate.html#class-physicsdirectbodystate) state **)** virtual |
| void | [add\_central\_force](#class-rigidbody-method-add-central-force) **(** [Vector3](class_vector3.html#class-vector3) force **)** |
| void | [add_force](#class-rigidbody-method-add-force) **(** [Vector3](class_vector3.html#class-vector3) force, [Vector3](class_vector3.html#class-vector3) position **)** |
| void | [add_torque](#class-rigidbody-method-add-torque) **(** [Vector3](class_vector3.html#class-vector3) torque **)** |
| void | [apply\_central\_impulse](#class-rigidbody-method-apply-central-impulse) **(** [Vector3](class_vector3.html#class-vector3) impulse **)** |
| void | [apply_impulse](#class-rigidbody-method-apply-impulse) **(** [Vector3](class_vector3.html#class-vector3) position, [Vector3](class_vector3.html#class-vector3) impulse **)** |
| void | [apply\_torque\_impulse](#class-rigidbody-method-apply-torque-impulse) **(** [Vector3](class_vector3.html#class-vector3) impulse **)** |
| [bool](class_bool.html#class-bool) | [get\_axis\_lock](#class-rigidbody-method-get-axis-lock) **(** [ось](class_physicsserver.html#enum-physicsserver-bodyaxis) оси **тела )** const |
| [Массив](class_array.html#class-array) | [get\_colliding\_bodies](#class-rigidbody-method-get-colliding-bodies) **(** **)** const |
| [Основа](class_basis.html#class-basis) | [get\_inverse\_inertia_tensor](#class-rigidbody-method-get-inverse-inertia-tensor) **(** **)** |
| void | [set\_axis\_lock](#class-rigidbody-method-set-axis-lock) **(** [ось](class_physicsserver.html#enum-physicsserver-bodyaxis) оси тела, [bool](class_bool.html#class-bool) lock **)** |
| void | [set\_axis\_velocity](#class-rigidbody-method-set-axis-velocity) **(** [Vector3](class_vector3.html#class-vector3) axis_velocity **)** |

Сигналы[¶](#signals "Постоянная ссылка на этот заголовок")
----------------------------------------------------------

* **body_entered** **(** [](class_node.html#class-node)тело узла **)**


Излучается при столкновении с другим [физическим телом](class_physicsbody.html#class-physicsbody) или [GridMap](class_gridmap.html#class-gridmap). Требуется[,](#class-rigidbody-property-contact-monitor) чтобы contact_monitor был установлен в `true`значение и [contacts_reported](#class-rigidbody-property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения. [GridMap](class_gridmap.html#class-gridmap)s обнаруживаются, если [MeshLibrary](class_meshlibrary.html#class-meshlibrary) имеет [форму](class_shape.html#class-shape)s столкновения.

`body`  [узел](class_node.html#class-node), если он существует в дереве, другого [physicsBody](class_physicsbody.html#class-physicsbody) или [GridMap](class_gridmap.html#class-gridmap).

* * *

* **body_exited** **(** [](class_node.html#class-node)тело узла **)**


Испускается, когда заканчивается столкновение с другим [физическим телом](class_physicsbody.html#class-physicsbody) или [GridMap](class_gridmap.html#class-gridmap). Требуется[,](#class-rigidbody-property-contact-monitor) чтобы contact_monitor был установлен в `true`значение и [contacts_reported](#class-rigidbody-property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения. [GridMap](class_gridmap.html#class-gridmap)s обнаруживаются, если [MeshLibrary](class_meshlibrary.html#class-meshlibrary) имеет [форму](class_shape.html#class-shape)s столкновения.

`body`  [узел](class_node.html#class-node), если он существует в дереве, другого [physicsBody](class_physicsbody.html#class-physicsbody) или [GridMap](class_gridmap.html#class-gridmap).

* * *

* **body\_shape\_entered** **(** [RID](class_rid.html#class-rid) body_rid, [Node](class_node.html#class-node) body, [int](class_int.html#class-int) body\_shape\_index, [int](class_int.html#class-int) local\_shape\_index **)**


Испускается, когда одна из [фигур](class_shape.html#class-shape)s этого твердого тела сталкивается с другой [](class_physicsbody.html#class-physicsbody)[](class_gridmap.html#class-gridmap)фигурой s physicsBody или GridMap[](class_shape.html#class-shape). Требуется[,](#class-rigidbody-property-contact-monitor) чтобы contact_monitor был установлен в `true`значение и [contacts_reported](#class-rigidbody-property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения. [GridMap](class_gridmap.html#class-gridmap)s обнаруживаются, если [MeshLibrary](class_meshlibrary.html#class-meshlibrary) имеет [форму](class_shape.html#class-shape)s столкновения.

`body_rid`  [избавление](class_rid.html#class-rid) от другого [объекта](class_physicsbody.html#class-physicsbody) physicsBody или [MeshLibrary CollisionObject](class_meshlibrary.html#class-meshlibrary)[,](class_collisionobject.html#class-collisionobject) используемого [PhysicsServer](class_physicsserver.html#class-physicsserver).

`body`  [узел](class_node.html#class-node), если он существует в дереве, другого [physicsBody](class_physicsbody.html#class-physicsbody) или [GridMap](class_gridmap.html#class-gridmap).

`body_shape_index` индекс [формы](class_shape.html#class-shape) другого [физического](class_physicsbody.html#class-physicsbody) тела или [GridMap](class_gridmap.html#class-gridmap), используемого физическим [сервером](class_physicsserver.html#class-physicsserver). Получить [](class_collisionshape.html#class-collisionshape)узел `body.shape_owner_get_owner(body_shape_index)`CollisionShape с.

`local_shape_index` индекс [формы](class_shape.html#class-shape) этого твердого тела, используемый сервером [PhysicsServer](class_physicsserver.html#class-physicsserver). Получить [](class_collisionshape.html#class-collisionshape)узел `self.shape_owner_get_owner(local_shape_index)`CollisionShape с.

**Примечание:** Физика пули не может определить индекс формы при использовании [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape). Не используйте несколько [CollisionShape](class_collisionshape.html#class-collisionshape)s при использовании [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape) с физикой пули, если вам нужны индексы формы.

* * *

* **body\_shape\_exited** **(** [RID](class_rid.html#class-rid) body_rid, [Node](class_node.html#class-node) body, [int](class_int.html#class-int) body\_shape\_index, [int](class_int.html#class-int) local\_shape\_index **)**


Испускается, когда заканчивается столкновение между одной из форм s этого твердого[тела](class_shape.html#class-shape) и другой [](class_physicsbody.html#class-physicsbody)[](class_gridmap.html#class-gridmap)формой s physicsBody или GridMap[](class_shape.html#class-shape). Требуется[,](#class-rigidbody-property-contact-monitor) чтобы contact_monitor был установлен в `true`значение и [contacts_reported](#class-rigidbody-property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения. [GridMap](class_gridmap.html#class-gridmap)s обнаруживаются, если [MeshLibrary](class_meshlibrary.html#class-meshlibrary) имеет [форму](class_shape.html#class-shape)s столкновения.

`body_rid`  [избавление](class_rid.html#class-rid) от другого [объекта](class_physicsbody.html#class-physicsbody) physicsBody или [MeshLibrary CollisionObject](class_meshlibrary.html#class-meshlibrary)[,](class_collisionobject.html#class-collisionobject) используемого [PhysicsServer](class_physicsserver.html#class-physicsserver). [GridMap](class_gridmap.html#class-gridmap)s обнаруживаются, если сетки имеют [форму](class_shape.html#class-shape)s.

`body`  [узел](class_node.html#class-node), если он существует в дереве, другого [physicsBody](class_physicsbody.html#class-physicsbody) или [GridMap](class_gridmap.html#class-gridmap).

`body_shape_index` индекс [формы](class_shape.html#class-shape) другого [физического](class_physicsbody.html#class-physicsbody) тела или [GridMap](class_gridmap.html#class-gridmap), используемого физическим [сервером](class_physicsserver.html#class-physicsserver). Получить [](class_collisionshape.html#class-collisionshape)узел `body.shape_owner_get_owner(body_shape_index)`CollisionShape с.

`local_shape_index` индекс [формы](class_shape.html#class-shape) этого твердого тела, используемый сервером [PhysicsServer](class_physicsserver.html#class-physicsserver). Получить [](class_collisionshape.html#class-collisionshape)узел `self.shape_owner_get_owner(local_shape_index)`CollisionShape с.

**Примечание:** Физика пули не может определить индекс формы при использовании [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape). Не используйте несколько [CollisionShape](class_collisionshape.html#class-collisionshape)s при использовании [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape) с физикой пули, если вам нужны индексы формы.

* * *

* **sleeping\_state\_changed** **(** **)**


Излучается, когда физический движок изменяет состояние сна тела.

**Примечание:** Изменение значения [sleeping](#class-rigidbody-property-sleeping) не вызовет этот сигнал. Он излучается только в том случае, если спящее состояние изменяется физическим движком или `emit_signal("sleeping_state_changed")`используется.

Перечисления[¶](#enumerations "Постоянная ссылка на этот заголовок")
--------------------------------------------------------------------

**режим перечисления**:

* **MODE_RIGID** = **0** \-\-\- Режим жесткого тела. Это "естественное" состояние твердого тела. Он подвержен воздействию сил и может перемещаться, вращаться и зависеть от кода пользователя.

* **MODE_STATIC** = **1** \-\-\- Статический режим. Тело ведет себя как [статическое](class_staticbody.html#class-staticbody)тело и может перемещаться только по пользовательскому коду.

* **MODE_CHARACTER** = **2** \-\-\- Режим тела персонажа. Это ведет себя как твердое тело, но не может вращаться.

* **MODE_KINEMATIC** = **3** \-\-\- Режим кинематического тела. Тело ведет себя как [кинематическое](class_kinematicbody.html#class-kinematicbody)тело и может двигаться только по пользовательскому коду.


Описание свойств[¶](#property-descriptions "Постоянная ссылка на этот заголовок")
---------------------------------------------------------------------------------

* [float](class_float.html#class-float) **angular_damp**


|     |     |
| --- | --- |
| _По умолчанию_ | `-1.0` |
| _Setter_ | set\_angular\_damp(значение) |
| _Getter_ | get\_angular\_damp() |

Гасит вращательные силы RigidBody.

См[. ProjectSettings.physics/3d/default\_angular\_damp](class_projectsettings.html#class-projectsettings-property-physics-3d-default-angular-damp) для получения более подробной информации о демпфировании.

* * *

* [Vector3](class_vector3.html#class-vector3) **angular_velocity**


|     |     |
| --- | --- |
| _По умолчанию_ | `Vector3( 0, 0, 0 )` |
| _Setter_ | set\_angular\_velocity(значение) |
| _Getter_ | get\_angular\_velocity() |

Скорость вращения тела в формате axis-angle. Величина вектора-это скорость вращения в _радианах_ в секунду.

* * *

* [bool](class_bool.html#class-bool) **axis\_lock\_angular_x**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_axis\_lock(значение) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте вращение корпуса по оси X.

* * *

* [bool](class_bool.html#class-bool) **axis\_lock\_angular_y**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_axis\_lock(значение) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте вращение корпуса по оси Y.

* * *

* [bool](class_bool.html#class-bool) **axis\_lock\_angular_z**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_axis\_lock(значение) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте вращение тела по оси Z.

* * *

* [bool](class_bool.html#class-bool) **axis\_lock\_linear_x**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_axis\_lock(значение) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте движение тела по оси X.

* * *

* [bool](class_bool.html#class-bool) **axis\_lock\_linear_y**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_axis\_lock(значение) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте движение тела по оси Y.

* * *

* [bool](class_bool.html#class-bool) **axis\_lock\_linear_z**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_axis\_lock(значение) |
| _Getter_ | get\_axis\_lock() |

Зафиксируйте движение тела по оси Z.

* * *

* [float](class_float.html#class-float) **bounce**


|     |     |
| --- | --- |
| _Setter_ | set_bounce(значение) |
| _Getter_ | get_bounce() |

Упругость тела. Значения варьируются от `0`(no bounce) до `1`(full bounciness).

Устарело, используйте [PhysicsMaterial.bounce](class_physicsmaterial.html#class-physicsmaterial-property-bounce) вместо этого через [physics\_material\_override](#class-rigidbody-property-physics-material-override).

* * *

* [bool](class_bool.html#class-bool) **can_sleep**


|     |     |
| --- | --- |
| _По умолчанию_ | `true` |
| _Setter_ | set\_can\_sleep(значение) |
| _Getter_ | is\_able\_to_sleep() |

Если `true`тело может войти в спящий режим , когда нет движения. См[. sleeping](#class-rigidbody-property-sleeping).

**Примечание:** RigidBody3D никогда не войдет в спящий режим автоматически, если его [режим](#class-rigidbody-property-mode)  [MODE_CHARACTER](#class-rigidbody-constant-mode-character). Его все еще можно перевести в спящий режим вручную, установив его [спящее](#class-rigidbody-property-sleeping) свойство на `true`.

* * *

* [bool](class_bool.html#class-bool) **contact_monitor**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_contact\_monitor(значение) |
| _Getter_ | is\_contact\_monitor_enabled() |

Если `true`, то RigidBody будет излучать сигналы при столкновении с другим RigidBody. См.Также [contacts_reported](#class-rigidbody-property-contacts-reported).

* * *

* [int](class_int.html#class-int) **contacts_reported**


|     |     |
| --- | --- |
| _По умолчанию_ | `0` |
| _Setter_ | set\_max\_contacts_reported(значение) |
| _Getter_ | get\_max\_contacts_reported() |

Максимальное количество контактов, которые будут записаны. Требуется[,](#class-rigidbody-property-contact-monitor) чтобы contact_monitor был установлен в `true`.

**Примечание:**  Количество контактов отличается от количества столкновений. Столкновения между параллельными ребрами приведут к двум контактам (по одному на каждом конце), а столкновения между параллельными гранями приведут к четырем контактам (по одному на каждом углу).

* * *

* [bool](class_bool.html#class-bool) **continuous_cd**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_use\_continuous\_collision\_detection(значение) |
| _Getter_ | is\_using\_continuous\_collision\_detection() |

Если `true`используется непрерывное обнаружение столкновений.

Continuous collision detection пытается предсказать, где столкнется движущееся тело, вместо того, чтобы перемещать его и корректировать его движение, если оно столкнулось. Непрерывное обнаружение столкновений является более точным и пропускает меньше ударов маленькими, быстро движущимися объектами. Не используя непрерывное обнаружение столкновений быстрее вычислять, но может пропустить небольшие, быстро движущиеся объекты.

* * *

* [bool](class_bool.html#class-bool) **custom_integrator**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set\_use\_custom_integrator(значение) |
| _Getter_ | is\_using\_custom_integrator() |

If `true`, internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the [\_integrate\_forces](#class-rigidbody-method-integrate-forces) function, if defined.

* * *

* [float](class_float.html#class-float) **friction**


|     |     |
| --- | --- |
| _Setter_ | set_friction(значение) |
| _Getter_ | get_friction() |

Трение кузова, от 0 (без трения) до 1 (максимальное трение).

Устарело, используйте [PhysicsMaterial.friction](class_physicsmaterial.html#class-physicsmaterial-property-friction) вместо этого через [physics\_material\_override](#class-rigidbody-property-physics-material-override).

* * *

* [float](class_float.html#class-float) **gravity_scale**


|     |     |
| --- | --- |
| _По умолчанию_ | `1.0` |
| _Setter_ | set\_gravity\_scale(значение) |
| _Getter_ | get\_gravity\_scale() |

Это умножается на глобальную настройку 3D gravity, найденную в **Project > Project Settings >> Physics >>> 3d>>>** для создания гравитации RigidBody. Например, значение 1 будет нормальной гравитацией, 2 будет применять двойную гравитацию, а 0,5 будет применять половину гравитации к этому объекту.

* * *

* [float](class_float.html#class-float) **linear_damp**


|     |     |
| --- | --- |
| _По умолчанию_ | `-1.0` |
| _Setter_ | set\_linear\_damp(значение) |
| _Getter_ | get\_linear\_damp() |

Линейная влажность тела. Не может быть меньше -1.0. Если это значение отличается от -1.0, любая линейная влажность, полученная из мира или областей, будет переопределена.

См[. ProjectSettings.physics/3d/default\_linear\_damp](class_projectsettings.html#class-projectsettings-property-physics-3d-default-linear-damp) для получения более подробной информации о демпфировании.

* * *

* [Vector3](class_vector3.html#class-vector3) **linear_velocity**


|     |     |
| --- | --- |
| _По умолчанию_ | `Vector3( 0, 0, 0 )` |
| _Setter_ | set\_linear\_velocity(значение) |
| _Getter_ | get\_linear\_velocity() |

Линейная скорость тела в единицах в секунду. Может использоваться спорадически, но **не устанавливайте это каждый кадр**, потому что физика может работать в другом потоке и работать с другой степенью детализации. Используйте [\_integrate\_forces](#class-rigidbody-method-integrate-forces) в качестве технологического цикла для точного контроля состояния тела.

* * *

* [](class_float.html#class-float)**масса поплавка**


|     |     |
| --- | --- |
| _По умолчанию_ | `1.0` |
| _Setter_ | set_mass(значение) |
| _Getter_ | get_mass() |

Масса тела.

* * *

* [Режим](#enum-rigidbody-mode) **mode**


|     |     |
| --- | --- |
| _По умолчанию_ | `0` |
| _Setter_ | set_mode(значение) |
| _Getter_ | get_mode() |

Режим кузова. [](#enum-rigidbody-mode)Возможные значения см. в разделе Mode.

* * *

* [PhysicsMaterial](class_physicsmaterial.html#class-physicsmaterial) **physics\_material\_override**


|     |     |
| --- | --- |
| _Setter_ | set\_physics\_material_override(значение) |
| _Getter_ | get\_physics\_material_override() |

Переопределение физического материала для тела.

Если материалу присвоено это свойство, он будет использоваться вместо любого другого физического материала, например унаследованного.

* * *

* [bool](class_bool.html#class-bool) **sleeping**


|     |     |
| --- | --- |
| _По умолчанию_ | `false` |
| _Setter_ | set_sleeping(значение) |
| _Getter_ | is_sleeping() |

Если `true`тело не будет двигаться и не будет вычислять силы , пока его не разбудит другое тело, например, при столкновении, или с помощью методов [apply_impulse](#class-rigidbody-method-apply-impulse) или [add_force](#class-rigidbody-method-add-force).

* * *

* [](class_float.html#class-float)**вес поплавка**


|     |     |
| --- | --- |
| _По умолчанию_ | `9.8` |
| _Setter_ | set_weight(значение) |
| _Getter_ | get_weight() |

Вес тела, основанный на его массе и глобальной 3D-гравитации. Глобальные значения задаются в **Project > Project Settings >> Physics >>> 3d>>>**.

Описание метода[¶](#method-descriptions "Постоянная ссылка на этот заголовок")
------------------------------------------------------------------------------

* void **\_integrate\_forces** **(** [PhysicsDirectBodyState](class_physicsdirectbodystate.html#class-physicsdirectbodystate) state **)** virtual


Вызывается во время обработки физики, позволяя считывать и безопасно изменять состояние моделирования для объекта. По умолчанию он работает в дополнение к обычному физическому поведению, но [](#class-rigidbody-property-custom-integrator)свойство custom_integrator позволяет отключить поведение по умолчанию и полностью настроить интеграцию силы для тела.

* * *

* void **add\_central\_force** **(** [Vector3](class_vector3.html#class-vector3) force **)**


Добавляет постоянную направленную силу (т. Е. Ускорение), не влияя на вращение.

Это эквивалентно `add_force(force, Vector3(0,0,0))`.

* * *

* void **add_force** **(** [Vector3](class_vector3.html#class-vector3) force, [Vector3](class_vector3.html#class-vector3) position **)**


Добавляет постоянную направленную силу (т. е. Ускорение).

Позиция использует вращение глобальной системы координат, но центрируется в начале координат объекта.

* * *

* void **add_torque** **(** [Vector3](class_vector3.html#class-vector3) torque **)**


Добавляет постоянную вращательную силу (т. е. Двигатель), не влияя на положение.

* * *

* void **apply\_central\_impulse** **(** [Vector3](class_vector3.html#class-vector3) impulse **)**


Применяет направленный импульс, не влияя на вращение.

Это эквивалентно `apply_impulse(Vector3(0,0,0), impulse)`.

* * *

* void **apply_impulse** **(** [Vector3](class_vector3.html#class-vector3) position, [Vector3](class_vector3.html#class-vector3) impulse **)**


Прикладывает позиционированный импульс к корпусу. Импульс не зависит от времени! Применение импульса к каждому кадру приведет к силе, зависящей от частоты кадров. По этой причине его следует использовать только при моделировании одноразовых воздействий. Позиция использует вращение глобальной системы координат, но центрируется в начале координат объекта.

* * *

* void **apply\_torque\_impulse** **(** [Vector3](class_vector3.html#class-vector3) impulse **)**


Применяет импульс крутящего момента, который будет зависеть от массы и формы тела. Это будет вращать тело вокруг `impulse`переданного вектора.

* * *

* [bool](class_bool.html#class-bool) **get\_axis\_lock** **(** [ось](class_physicsserver.html#enum-physicsserver-bodyaxis) оси **тела )** const


Возвращает`true`, если заданная линейная или вращательная ось заблокирована.

* * *

* [Массив](class_array.html#class-array) **get\_colliding\_bodies** **(** **)** const


Возвращает список тел, сталкивающихся с этим. Требуется[,](#class-rigidbody-property-contact-monitor) чтобы contact_monitor был установлен в `true`значение и [contacts_reported](#class-rigidbody-property-contacts-reported) был установлен достаточно высоко, чтобы обнаружить все столкновения.

**Примечание:**  Результат этого теста не сразу после перемещения объектов. Для производительности список столкновений обновляется один раз за кадр и перед шагом физики. Вместо этого рассмотрите возможность использования сигналов.

* * *

* [Basis](class_basis.html#class-basis) **get\_inverse\_inertia_tensor** **(** **)**


Возвращает базис обратного тензора инерции. Это используется для расчета углового ускорения, возникающего в результате крутящего момента, приложенного к жесткому телу.

* * *

* void **set\_axis\_lock** **(** [ось](class_physicsserver.html#enum-physicsserver-bodyaxis) оси тела, [](class_bool.html#class-bool)блокировка bool **)**


Фиксирует указанную линейную или вращательную ось.

* * *

* void **set\_axis\_velocity** **(** [Vector3](class_vector3.html#class-vector3) axis_velocity **)**


Устанавливает скорость оси. Скорость на заданной векторной оси будет установлена как заданная длина вектора. Это полезно для прыжкового поведения.