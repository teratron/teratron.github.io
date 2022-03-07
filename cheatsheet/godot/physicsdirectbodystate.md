# PhysicsDirectBodyState

**���������:** [������](class_object.md#class-object)

������ ������� ������� � ����������� ���� � [PhysicsServer](class_physicsserver.md#class-physicsserver).

## ��������

������������ ������ ������ � ����������� ���� �� [���������� �������](class_physicsserver.md#class-physicsserver),
�������� ��������� �������� ���������� ��������. ���� ������ ���������� ����� ������ �������� ����� ���������
�������/���������� ��� � ������������ ��� ��������� ������� ��������� ����� ����.
��[. RigidBody.\_integrate_forces](class_rigidbody.md#class-rigidbody-method-integrate-forces).

## �����������[�](#tutorials "���������� ������ �� ���� ���������")

[�������� � ������](../tutorials/physics/physics_introduction.md)
[Ray-casting](../tutorials/physics/ray-casting.md)

## ��������[�](#properties "���������� ������ �� ���� ���������")

| | |
| --- | --- |
| [Vector3](class_vector3.md)            | [angular_velocity](#class-physicsdirectbodystate-property-angular-velocity)             |
| [Vector3](class_vector3.md)            | [center_of_mass](#class-physicsdirectbodystate-property-center-of-mass)                 |
| [Vector3](class_vector3.md)            | [inverse_inertia](#class-physicsdirectbodystate-property-inverse-inertia)               |
| [float](class_float.md)                  | [inverse_mass](#class-physicsdirectbodystate-property-inverse-mass)                     |
| [Vector3](class_vector3.md)            | [linear_velocity](#class-physicsdirectbodystate-property-linear-velocity)               |
| [������](class_basis.md)                 | [principal_inertia_axes](#class-physicsdirectbodystate-property-principal-inertia-axes) |
| [bool](class_bool.md#class-bool)                     | [������](#class-physicsdirectbodystate-property-sleeping)                               |
| [float](class_float.md)                  | [���](#class-physicsdirectbodystate-property-step)                                      |
| [float](class_float.md)                  | [total_angular_damp](#class-physicsdirectbodystate-property-total-angular-damp)         |
| [Vector3](class_vector3.md)            | [total_gravity](#class-physicsdirectbodystate-property-total-gravity)                   |
| [float](class_float.md)                  | [total_linear_damp](#class-physicsdirectbodystate-property-total-linear-damp)           |
| [��������������](class_transform.md) | [��������������](#class-physicsdirectbodystate-property-transform)                      |

## ������[�](#methods "���������� ������ �� ���� ���������")

|                                                                                             |                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| void                                                                                        | [add_central_force](#class-physicsdirectbodystate-method-add-central-force) **(** [Vector3](class_vector3.md) force **)**                                                 |
| void                                                                                        | [add_force](#class-physicsdirectbodystate-method-add-force) **(** [Vector3](class_vector3.md) force, [Vector3](class_vector3.md) position **)**           |
| void                                                                                        | [add_torque](#class-physicsdirectbodystate-method-add-torque) **(** [Vector3](class_vector3.md) torque **)**                                                              |
| void                                                                                        | [apply_central_impulse](#class-physicsdirectbodystate-method-apply-central-impulse) **(** [Vector3](class_vector3.md) j **)**                                             |
| void                                                                                        | [apply_impulse](#class-physicsdirectbodystate-method-apply-impulse) **(** [Vector3](class_vector3.md) position, [Vector3](class_vector3.md) j **)**       |
| void                                                                                        | [apply_torque_impulse](#class-physicsdirectbodystate-method-apply-torque-impulse) **(** [Vector3](class_vector3.md) j **)**                                               |
| [RID](class_rid.md#class-rid)                                                             | [get_contact_collider](#class-physicsdirectbodystate-method-get-contact-collider) **(** [int](class_int.md#class-int) contact_idx **)** const                                           |
| [int](class_int.md#class-int)                                                             | [get_contact_collider_id](#class-physicsdirectbodystate-method-get-contact-collider-id) **(** [int](class_int.md#class-int) contact_idx **)** const                                     |
| [������](class_object.md#class-object)                                                    | [get_contact_collider_object](#class-physicsdirectbodystate-method-get-contact-collider-object) **(** [int](class_int.md#class-int) contact_idx **)** const                             |
| [Vector3](class_vector3.md)                                                 | [get_contact_collider_position](#class-physicsdirectbodystate-method-get-contact-collider-position) **(** [int](class_int.md#class-int) contact_idx **)** const                         |
| [int](class_int.md#class-int)                                                             | [get_contact_collider_shape](#class-physicsdirectbodystate-method-get-contact-collider-shape) **(** [int](class_int.md#class-int) contact_idx **)** const                               |
| [Vector3](class_vector3.md)                                                 | [get_contact_collider_velocity_at_position](#class-physicsdirectbodystate-method-get-contact-collider-velocity-at-position) **(** [int](class_int.md#class-int) contact_idx **)** const |
| [int](class_int.md#class-int)                                                             | [get_contact_count](#class-physicsdirectbodystate-method-get-contact-count) **(** **)** const                                                                                             |
| [float](class_float.md)                                                       | [get_contact_impulse](#class-physicsdirectbodystate-method-get-contact-impulse) **(** [int](class_int.md#class-int) contact_idx **)** const                                             |
| [Vector3](class_vector3.md)                                                 | [get_contact_local_normal](#class-physicsdirectbodystate-method-get-contact-local-normal) **(** [int](class_int.md#class-int) contact_idx **)** const                                   |
| [Vector3](class_vector3.md)                                                 | [get_contact_local_position](#class-physicsdirectbodystate-method-get-contact-local-position) **(** [int](class_int.md#class-int) contact_idx **)** const                               |
| [int](class_int.md#class-int)                                                             | [get_contact_local_shape](#class-physicsdirectbodystate-method-get-contact-local-shape) **(** [int](class_int.md#class-int) contact_idx **)** const                                     |
| [PhysicsDirectSpaceState](class_physicsdirectspacestate.md#class-physicsdirectspacestate) | [get_space_state](#class-physicsdirectbodystate-method-get-space-state) **(** **)**                                                                                                       |
| [Vector3](class_vector3.md)                                                 | [get_velocity_at_local_position](#class-physicsdirectbodystate-method-get-velocity-at-local-position) **(** [Vector3](class_vector3.md) local_position **)** const        |
| void                                                                                        | [integrate_forces](#class-physicsdirectbodystate-method-integrate-forces) **(** **)**                                                                                                     |

## �������� �������[�](#property-descriptions "���������� ������ �� ���� ���������")

[Vector3](class_vector3.md) **angular_velocity**

|          |                                |
| -------- | ------------------------------ |
| _������_ | set_angular_velocity(��������) |
| _������_ | get_angular_velocity()         |

�������� �������� ���� � ������� axis-angle. �������� �������-��� �������� �������� � _��������_ � �������.

---

[Vector3](class_vector3.md) **center_of_mass**

|          |                      |
| -------- | -------------------- |
| _������_ | get_center_of_mass() |

---

[Vector3](class_vector3.md) **inverse_inertia**

|          |                       |
| -------- | --------------------- |
| _������_ | get_inverse_inertia() |

�������� �������� ������� ����.

---

[float](class_float.md) **inverse_mass**

|          |                    |
| -------- | ------------------ |
| _������_ | get_inverse_mass() |

�������� ����� ����.

---

[Vector3](class_vector3.md) **linear_velocity**

|          |                               |
| -------- | ----------------------------- |
| _������_ | set_linear_velocity(��������) |
| _������_ | get_linear_velocity()         |

�������� �������� ���� � �������� � �������.

---

[Basis](class_basis.md **principal_inertia_axes**

|          |                              |
| -------- | ---------------------------- |
| _������_ | get_principal_inertia_axes() |

---

[bool](class_bool.md#class-bool) **sleeping**

|          |                           |
| -------- | ------------------------- |
| _������_ | set_sleep_state(��������) |
| _������_ | is_sleeping()             |

���� `true`��� ���� � ������ ������ ���� (�� �������).

---

[float](class_float.md) **step**

|          |            |
| -------- | ---------- |
| _������_ | get_step() |

��������� ��� (������), ������������ ��� �������������.

---

[float](class_float.md) **total_angular_damp**

|          |                          |
| -------- | ------------------------ |
| _������_ | get_total_angular_damp() |

��������, � ������� ���� ��������� ���������, ���� ��� ������� ������ ���, �������� ���.

---

[Vector3](class_vector3.md) **total_gravity**

|          |                     |
| -------- | ------------------- |
| _������_ | get_total_gravity() |

������ ������ ����������, ����������� � ��������� ����� � ����� ����.

---

[float](class_float.md) **total_linear_damp**

|          |                         |
| -------- | ----------------------- |
| _������_ | get_total_linear_damp() |

��������, � ������� ���� ��������� ���������, ���� ��� �� ������� ������� ������ ����.

---

[Transform](class_transform.md) **transform**

|          |                         |
| -------- | ----------------------- |
| _������_ | set_transform(��������) |
| _������_ | get_transform()         |

������� �������������� ����.

## �������� ������[�](#method-descriptions "���������� ������ �� ���� ���������")

- void **add_central_force** **(** [Vector3](class_vector3.md) force **)**

��������� ���������� ������������ ����, �� ����� �� ��������.

��� ������������ `add_force(force, Vector3(0,0,0))`.

---

- void **add_force** **(** [Vector3](class_vector3.md) force, [Vector3](class_vector3.md) position **)**

��������� ��������������� ���� � ����. � ����, � �������� �� ������ ��������� ���� ��������� � ���������� �����������.

---

- void **add_torque** **(** [Vector3](class_vector3.md) torque **)**

��������� ���������� ������������ ����, �� ����� �� ���������.

---

- void **apply_central_impulse** **(** [Vector3](class_vector3.md) j **)**

��������� ���� ������������ �������, �� ����� �� ��������.

��� ������������ `apply_impulse(Vector3(0, 0, 0), impulse)`.

---

- void **apply_impulse** **(** [Vector3](class_vector3.md) position, [Vector3](class_vector3.md) j **)**

��������� ����������������� ������� � ����. ������� �� ������� �� �������! ���������� �������� � ������� ����� ��������
� ����, ��������� �� ������� ������. �� ���� ������� ��� ������� ������������ ������ ��� ������������� �����������
�����������. ������� ���������� �������� ���������� ������� ���������, �� ������������ � ������ ��������� �������.

---

- void **apply_torque_impulse** **(** [Vector3](class_vector3.md) j **)**

��������� ������� ��������� ������� (������� ����� �������� �� ����� � ����� ����). ��� ����� ������� ���� ������
�������`j`, ����������� � �������� ���������.

---

[RID](class_rid.md#class-rid) **get_contact_collider** **(** [int](class_int.md#class-int) contact_idx **)** const

���������� [RID ����������](class_rid.md#class-rid).

---

[int](class_int.md#class-int) **get_contact_collider_id** **(** [int](class_int.md#class-int) contact_idx **)** const

���������� ������������� ������� ����������.

---

[������](class_object.md#class-object) **get_contact_collider_object** **(** [int](class_int.md#class-int)
contact_idx **)** const

���������� ������ collider.

---

[Vector3](class_vector3.md) **get_contact_collider_position** **(** [int](class_int.md#class-int) contact_idx **)**
const

���������� ��������� �������� � ����������.

---

[int](class_int.md#class-int) **get_contact_collider_shape** **(** [int](class_int.md#class-int) contact_idx **)** const

���������� ������ ����� ����������.

---

[Vector3](class_vector3.md) **get_contact_collider_velocity_at_position** **(** [int](class_int.md#class-int)
contact_idx **)** const

���������� ������ �������� �������� � ����� �������� ����������.

---

[int](class_int.md#class-int) **get_contact_count** **(** **)** const

���������� ���������� ��������� ����� ���� � ������� ������.

**����������:** �� ��������� ������������ 0, ���� ���� �� ��������� ��� ����������� ���������.
��[. RigidBody.contact_monitor](class_rigidbody.md#class-rigidbody-property-contact-monitor).

---

[float](class_float.md) **get_contact_impulse** **(** [int](class_int.md#class-int) contact_idx **)** const

�������, ��������� ���������. ����������� ������ ��� ������ ����.

---

[Vector3](class_vector3.md) **get_contact_local_normal** **(** [int](class_int.md#class-int) contact_idx **)** const

���������� ��������� ������� � ����� ��������.

---

[Vector3](class_vector3.md) **get_contact_local_position** **(** [int](class_int.md#class-int) contact_idx **)** const

���������� ��������� ��������� ����� ��������.

---

[int](class_int.md#class-int) **get_contact_local_shape** **(** [int](class_int.md#class-int) contact_idx **)** const

���������� ��������� ������ ����� ������������.

---

[PhysicsDirectSpaceState](class_physicsdirectspacestate.md#class-physicsdirectspacestate) **
get_space_state** **(** **)**

���������� ������� ��������� ������������, �������� ��� ��������.

---

[Vector3](class_vector3.md) **get_velocity_at_local_position** **(** [Vector3](class_vector3.md) local_position **)**
const

���������� �������� ���� � �������� ������������� ���������, ������� ��� �������, ��� � ��������.

---

- void **integrate_forces** **(** **)**

�������� ���������� ��� ���������� force.
