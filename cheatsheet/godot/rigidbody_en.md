RigidBody
===

**
Inherits:** [PhysicsBody](class_physicsbody.html#class-physicsbody) **<** [CollisionObject](class_collisionobject.html#class-collisionobject) **<** [Spatial](class_spatial.html#class-spatial) **<** [Node](class_node.html#class-node) **<** [Object](class_object.html#class-object)

**Inherited By:** [VehicleBody](class_vehiclebody.html#class-vehiclebody)

Physics Body whose position is determined through physics simulation in 3D space.

Description
-----------

This is the node that implements full 3D physics. This means that you do not control a RigidBody directly. Instead, you
can apply forces to it (gravity, impulses, etc.), and the physics simulation will calculate the resulting movement,
collision, bouncing, rotating, etc.

A RigidBody has 4 behavior [mode](#property-mode)s: Rigid, Static, Character, and Kinematic.

**Note:** Don't change a RigidBody's position every frame or very often. Sporadic changes work fine, but physics runs at
a different granularity (fixed Hz) than usual rendering (process callback) and maybe even in a separate thread, so
changing this from a process loop may result in strange behavior. If you need to directly affect the body's state,
use [\_integrate\_forces](#method-integrate-forces), which allows you to directly access the physics state.

If you need to override the default physics behavior, you can write a custom force integration function.
See [custom_integrator](#property-custom-integrator).

With Bullet physics (the default), the center of mass is the RigidBody3D center. With GodotPhysics, the center of mass
is the average of the [CollisionShape](class_collisionshape.html#class-collisionshape) centers.

Properties
---

|     |     |     |
| --- | --- | --- |  
| [float](class_float.html#class-float) | [angular_damp](#property-angular-damp) | `-1.0` |
| [Vector3](class_vector3.html#class-vector3) | [angular_velocity](#property-angular-velocity) | `Vector3( 0, 0, 0 )` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_angular_x](#property-axis-lock-angular-x) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_angular_y](#property-axis-lock-angular-y) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_angular_z](#property-axis-lock-angular-z) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_linear_x](#property-axis-lock-linear-x) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_linear_y](#property-axis-lock-linear-y) | `false` |
| [bool](class_bool.html#class-bool) | [axis\_lock\_linear_z](#property-axis-lock-linear-z) | `false` |
| [float](class_float.html#class-float) | [bounce](#property-bounce) |     |
| [bool](class_bool.html#class-bool) | [can_sleep](#property-can-sleep) | `true` |
| [bool](class_bool.html#class-bool) | [contact_monitor](#property-contact-monitor) | `false` |
| [int](class_int.html#class-int) | [contacts_reported](#property-contacts-reported) | `0` |
| [bool](class_bool.html#class-bool) | [continuous_cd](#property-continuous-cd) | `false` |
| [bool](class_bool.html#class-bool) | [custom_integrator](#property-custom-integrator) | `false` |
| [float](class_float.html#class-float) | [friction](#property-friction) |     |
| [float](class_float.html#class-float) | [gravity_scale](#property-gravity-scale) | `1.0` |
| [float](class_float.html#class-float) | [linear_damp](#property-linear-damp) | `-1.0` |
| [Vector3](class_vector3.html#class-vector3) | [linear_velocity](#property-linear-velocity) | `Vector3( 0, 0, 0 )` |
| [float](class_float.html#class-float) | [mass](#property-mass) | `1.0` |
| [Mode](#enum-rigidbody-mode) | [mode](#property-mode) | `0` |
| [PhysicsMaterial](class_physicsmaterial.html#class-physicsmaterial) | [physics\_material\_override](#property-physics-material-override) |     |
| [bool](class_bool.html#class-bool) | [sleeping](#property-sleeping) | `false` |
| [float](class_float.html#class-float) | [weight](#property-weight) | `9.8` |

Methods
---

|     |     |
| --- | --- |  
| void | [\_integrate\_forces](#method-integrate-forces) **(** [PhysicsDirectBodyState](class_physicsdirectbodystate.html#class-physicsdirectbodystate) state **)** virtual |
| void | [add\_central\_force](#method-add-central-force) **(** [Vector3](class_vector3.html#class-vector3) force **)** |
| void | [add_force](#method-add-force) **(** [Vector3](class_vector3.html#class-vector3) force, [Vector3](class_vector3.html#class-vector3) position **)** |
| void | [add_torque](#method-add-torque) **(** [Vector3](class_vector3.html#class-vector3) torque **)** |
| void | [apply\_central\_impulse](#method-apply-central-impulse) **(** [Vector3](class_vector3.html#class-vector3) impulse **)** |
| void | [apply_impulse](#method-apply-impulse) **(** [Vector3](class_vector3.html#class-vector3) position, [Vector3](class_vector3.html#class-vector3) impulse **)** |
| void | [apply\_torque\_impulse](#method-apply-torque-impulse) **(** [Vector3](class_vector3.html#class-vector3) impulse **)** |
| [bool](class_bool.html#class-bool) | [get\_axis\_lock](#method-get-axis-lock) **(** [BodyAxis](class_physicsserver.html#enum-physicsserver-bodyaxis) axis **)** const |
| [Array](class_array.html#class-array) | [get\_colliding\_bodies](#method-get-colliding-bodies) **(** **)** const |
| [Basis](class_basis.html#class-basis) | [get\_inverse\_inertia_tensor](#method-get-inverse-inertia-tensor) **(** **)** |
| void | [set\_axis\_lock](#method-set-axis-lock) **(** [BodyAxis](class_physicsserver.html#enum-physicsserver-bodyaxis) axis, [bool](class_bool.html#class-bool) lock **)** |
| void | [set\_axis\_velocity](#method-set-axis-velocity) **(** [Vector3](class_vector3.html#class-vector3) axis_velocity **)** |

Signals[¶](#signals "Permalink to this headline")
---

* **body_entered** **(** [Node](class_node.html#class-node) body **)**

Emitted when a collision with another [PhysicsBody](class_physicsbody.html#class-physicsbody)
or [GridMap](class_gridmap.html#class-gridmap) occurs. Requires [contact_monitor](#property-contact-monitor) to be set
to `true` and [contacts_reported](#property-contacts-reported) to be set high enough to detect all the
collisions. [GridMap](class_gridmap.html#class-gridmap)s are detected if
the [MeshLibrary](class_meshlibrary.html#class-meshlibrary) has Collision [Shape](class_shape.html#class-shape)s.

`body` the [Node](class_node.html#class-node), if it exists in the tree, of the
other [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap).

***

* **body_exited** **(** [Node](class_node.html#class-node) body **)**

Emitted when the collision with another [PhysicsBody](class_physicsbody.html#class-physicsbody)
or [GridMap](class_gridmap.html#class-gridmap) ends. Requires [contact_monitor](#property-contact-monitor) to be set
to `true` and [contacts_reported](#property-contacts-reported) to be set high enough to detect all the
collisions. [GridMap](class_gridmap.html#class-gridmap)s are detected if
the [MeshLibrary](class_meshlibrary.html#class-meshlibrary) has Collision [Shape](class_shape.html#class-shape)s.

`body` the [Node](class_node.html#class-node), if it exists in the tree, of the
other [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap).

***

* **body\_shape\_entered** **(** [RID](class_rid.html#class-rid) body_rid, [Node](class_node.html#class-node)
  body, [int](class_int.html#class-int) body\_shape\_index, [int](class_int.html#class-int) local\_shape\_index **)**

Emitted when one of this RigidBody's [Shape](class_shape.html#class-shape)s collides with
another [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap)'
s [Shape](class_shape.html#class-shape)s. Requires [contact_monitor](#property-contact-monitor) to be set to `true`
and [contacts_reported](#property-contacts-reported) to be set high enough to detect all the
collisions. [GridMap](class_gridmap.html#class-gridmap)s are detected if
the [MeshLibrary](class_meshlibrary.html#class-meshlibrary) has Collision [Shape](class_shape.html#class-shape)s.

`body_rid` the [RID](class_rid.html#class-rid) of the other [PhysicsBody](class_physicsbody.html#class-physicsbody)
or [MeshLibrary](class_meshlibrary.html#class-meshlibrary)'
s [CollisionObject](class_collisionobject.html#class-collisionobject) used by
the [PhysicsServer](class_physicsserver.html#class-physicsserver).

`body` the [Node](class_node.html#class-node), if it exists in the tree, of the
other [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap).

`body_shape_index` the index of the [Shape](class_shape.html#class-shape) of the
other [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap) used by
the [PhysicsServer](class_physicsserver.html#class-physicsserver). Get
the [CollisionShape](class_collisionshape.html#class-collisionshape) node
with `body.shape_owner_get_owner(body_shape_index)`.

`local_shape_index` the index of the [Shape](class_shape.html#class-shape) of this RigidBody used by
the [PhysicsServer](class_physicsserver.html#class-physicsserver). Get
the [CollisionShape](class_collisionshape.html#class-collisionshape) node
with `self.shape_owner_get_owner(local_shape_index)`.

**Note:** Bullet physics cannot identify the shape index when using
a [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape). Don't use
multiple [CollisionShape](class_collisionshape.html#class-collisionshape)s when using
a [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape) with Bullet physics if you need shape
indices.

***

* **body\_shape\_exited** **(** [RID](class_rid.html#class-rid) body_rid, [Node](class_node.html#class-node)
  body, [int](class_int.html#class-int) body\_shape\_index, [int](class_int.html#class-int) local\_shape\_index **)**

Emitted when the collision between one of this RigidBody's [Shape](class_shape.html#class-shape)s and
another [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap)'
s [Shape](class_shape.html#class-shape)s ends. Requires [contact_monitor](#property-contact-monitor) to be set to `true`
and [contacts_reported](#property-contacts-reported) to be set high enough to detect all the
collisions. [GridMap](class_gridmap.html#class-gridmap)s are detected if
the [MeshLibrary](class_meshlibrary.html#class-meshlibrary) has Collision [Shape](class_shape.html#class-shape)s.

`body_rid` the [RID](class_rid.html#class-rid) of the other [PhysicsBody](class_physicsbody.html#class-physicsbody)
or [MeshLibrary](class_meshlibrary.html#class-meshlibrary)'
s [CollisionObject](class_collisionobject.html#class-collisionobject) used by
the [PhysicsServer](class_physicsserver.html#class-physicsserver). [GridMap](class_gridmap.html#class-gridmap)s are
detected if the Meshes have [Shape](class_shape.html#class-shape)s.

`body` the [Node](class_node.html#class-node), if it exists in the tree, of the
other [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap).

`body_shape_index` the index of the [Shape](class_shape.html#class-shape) of the
other [PhysicsBody](class_physicsbody.html#class-physicsbody) or [GridMap](class_gridmap.html#class-gridmap) used by
the [PhysicsServer](class_physicsserver.html#class-physicsserver). Get
the [CollisionShape](class_collisionshape.html#class-collisionshape) node
with `body.shape_owner_get_owner(body_shape_index)`.

`local_shape_index` the index of the [Shape](class_shape.html#class-shape) of this RigidBody used by
the [PhysicsServer](class_physicsserver.html#class-physicsserver). Get
the [CollisionShape](class_collisionshape.html#class-collisionshape) node
with `self.shape_owner_get_owner(local_shape_index)`.

**Note:** Bullet physics cannot identify the shape index when using
a [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape). Don't use
multiple [CollisionShape](class_collisionshape.html#class-collisionshape)s when using
a [ConcavePolygonShape](class_concavepolygonshape.html#class-concavepolygonshape) with Bullet physics if you need shape
indices.

***

* **sleeping\_state\_changed** **(** **)**

Emitted when the physics engine changes the body's sleeping state.

**Note:** Changing the value [sleeping](#property-sleeping) will not trigger this signal. It is only emitted if the
sleeping state is changed by the physics engine or `emit_signal("sleeping_state_changed")` is used.

Enumerations[¶](#enumerations "Permalink to this headline")
-------------

enum **Mode**:

* **MODE_RIGID** = **0** \-\-\- Rigid body mode. This is the "natural" state of a rigid body. It is affected by forces,
  and can move, rotate, and be affected by user code.

* **MODE_STATIC** = **1** \-\-\- Static mode. The body behaves like
  a [StaticBody](class_staticbody.html#class-staticbody), and can only move by user code.

* **MODE_CHARACTER** = **2** \-\-\- Character body mode. This behaves like a rigid body, but can not rotate.

* **MODE_KINEMATIC** = **3** \-\-\- Kinematic body mode. The body behaves like
  a [KinematicBody](class_kinematicbody.html#class-kinematicbody), and can only move by user code.

Property Descriptions[¶](#property-descriptions "Permalink to this headline")
-------------------------------

* [float](class_float.html#class-float) **angular_damp**

|     |     |
| --- | --- |  
| _Default_ | `-1.0` |
| _Setter_ | set\_angular\_damp(value) |
| _Getter_ | get\_angular\_damp() |

Damps RigidBody's rotational forces.

See [ProjectSettings.physics/3d/default\_angular\_damp](class_projectsettings.html#class-projectsettings-property-physics-3d-default-angular-damp)
for more details about damping.

***

* [Vector3](class_vector3.html#class-vector3) **angular_velocity**

|     |     |
| --- | --- |  
| _Default_ | `Vector3( 0, 0, 0 )` |
| _Setter_ | set\_angular\_velocity(value) |
| _Getter_ | get\_angular\_velocity() |

The body's rotational velocity in axis-angle format. The magnitude of the vector is the rotation rate in _radians_ per
second.

***

* [bool](class_bool.html#class-bool) **axis\_lock\_angular_x**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Lock the body's rotation in the X axis.

***

* [bool](class_bool.html#class-bool) **axis\_lock\_angular_y**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Lock the body's rotation in the Y axis.

***

* [bool](class_bool.html#class-bool) **axis\_lock\_angular_z**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Lock the body's rotation in the Z axis.

***

* [bool](class_bool.html#class-bool) **axis\_lock\_linear_x**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Lock the body's movement in the X axis.

***

* [bool](class_bool.html#class-bool) **axis\_lock\_linear_y**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Lock the body's movement in the Y axis.

***

* [bool](class_bool.html#class-bool) **axis\_lock\_linear_z**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_axis\_lock(value) |
| _Getter_ | get\_axis\_lock() |

Lock the body's movement in the Z axis.

***

* [float](class_float.html#class-float) **bounce**

|     |     |
| --- | --- |  
| _Setter_ | set_bounce(value) |
| _Getter_ | get_bounce() |

The body's bounciness. Values range from `0` (no bounce) to `1` (full bounciness).

Deprecated, use [PhysicsMaterial.bounce](class_physicsmaterial.html#class-physicsmaterial-property-bounce) instead
via [physics\_material\_override](#property-physics-material-override).

***

* [bool](class_bool.html#class-bool) **can_sleep**

|     |     |
| --- | --- |  
| _Default_ | `true` |
| _Setter_ | set\_can\_sleep(value) |
| _Getter_ | is\_able\_to_sleep() |

If `true`, the body can enter sleep mode when there is no movement. See [sleeping](#property-sleeping).

**Note:** A RigidBody3D will never enter sleep mode automatically if its [mode](#property-mode)
is [MODE_CHARACTER](#constant-mode-character). It can still be put to sleep manually by setting
its [sleeping](#property-sleeping) property to `true`.

***

* [bool](class_bool.html#class-bool) **contact_monitor**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_contact\_monitor(value) |
| _Getter_ | is\_contact\_monitor_enabled() |

If `true`, the RigidBody will emit signals when it collides with another RigidBody. See
also [contacts_reported](#property-contacts-reported).

***

* [int](class_int.html#class-int) **contacts_reported**

|     |     |
| --- | --- |  
| _Default_ | `0` |
| _Setter_ | set\_max\_contacts_reported(value) |
| _Getter_ | get\_max\_contacts_reported() |

The maximum number of contacts that will be recorded. Requires [contact_monitor](#property-contact-monitor) to be set
to `true`.

**Note:** The number of contacts is different from the number of collisions. Collisions between parallel edges will
result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at
each corner).

***

* [bool](class_bool.html#class-bool) **continuous_cd**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_use\_continuous\_collision\_detection(value) |
| _Getter_ | is\_using\_continuous\_collision\_detection() |

If `true`, continuous collision detection is used.

Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting
its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small,
fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving
objects.

***

* [bool](class_bool.html#class-bool) **custom_integrator**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set\_use\_custom_integrator(value) |
| _Getter_ | is\_using\_custom_integrator() |

If `true`, internal force integration will be disabled (like gravity or air friction) for this body. Other than
collision response, the body will only move as determined by the [\_integrate\_forces](#method-integrate-forces)
function, if defined.

***

* [float](class_float.html#class-float) **friction**

|     |     |
| --- | --- |  
| _Setter_ | set_friction(value) |
| _Getter_ | get_friction() |

The body's friction, from 0 (frictionless) to 1 (max friction).

Deprecated, use [PhysicsMaterial.friction](class_physicsmaterial.html#class-physicsmaterial-property-friction) instead
via [physics\_material\_override](#property-physics-material-override).

***

* [float](class_float.html#class-float) **gravity_scale**

|     |     |
| --- | --- |  
| _Default_ | `1.0` |
| _Setter_ | set\_gravity\_scale(value) |
| _Getter_ | get\_gravity\_scale() |

This is multiplied by the global 3D gravity setting found in **Project > Project Settings > Physics > 3d** to produce
RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply
half gravity to this object.

***

* [float](class_float.html#class-float) **linear_damp**

|     |     |
| --- | --- |  
| _Default_ | `-1.0` |
| _Setter_ | set\_linear\_damp(value) |
| _Getter_ | get\_linear\_damp() |

The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the
world or areas will be overridden.

See [ProjectSettings.physics/3d/default\_linear\_damp](class_projectsettings.html#class-projectsettings-property-physics-3d-default-linear-damp)
for more details about damping.

***

* [Vector3](class_vector3.html#class-vector3) **linear_velocity**

|     |     |
| --- | --- |  
| _Default_ | `Vector3( 0, 0, 0 )` |
| _Setter_ | set\_linear\_velocity(value) |
| _Getter_ | get\_linear\_velocity() |

The body's linear velocity in units per second. Can be used sporadically, but **don't set this every frame**, because
physics may run in another thread and runs at a different granularity.
Use [\_integrate\_forces](#method-integrate-forces) as your process loop for precise control of the body state.

***

* [float](class_float.html#class-float) **mass**

|     |     |
| --- | --- |  
| _Default_ | `1.0` |
| _Setter_ | set_mass(value) |
| _Getter_ | get_mass() |

The body's mass.

***

* [Mode](#enum-rigidbody-mode) **mode**

|     |     |
| --- | --- |  
| _Default_ | `0` |
| _Setter_ | set_mode(value) |
| _Getter_ | get_mode() |

The body mode. See [Mode](#enum-rigidbody-mode) for possible values.

***

* [PhysicsMaterial](class_physicsmaterial.html#class-physicsmaterial) **physics\_material\_override**

|     |     |
| --- | --- |  
| _Setter_ | set\_physics\_material_override(value) |
| _Getter_ | get\_physics\_material_override() |

The physics material override for the body.

If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited
one.

***

* [bool](class_bool.html#class-bool) **sleeping**

|     |     |
| --- | --- |  
| _Default_ | `false` |
| _Setter_ | set_sleeping(value) |
| _Getter_ | is_sleeping() |

If `true`, the body will not move and will not calculate forces until woken up by another body through, for example, a
collision, or by using the [apply_impulse](#method-apply-impulse) or [add_force](#method-add-force) methods.

***

* [float](class_float.html#class-float) **weight**

|     |     |
| --- | --- |  
| _Default_ | `9.8` |
| _Setter_ | set_weight(value) |
| _Getter_ | get_weight() |

The body's weight based on its mass and the global 3D gravity. Global values are set in **Project > Project Settings >
Physics > 3d**.

Method Descriptions[¶](#method-descriptions "Permalink to this headline")
---------------------------

* void **
  \_integrate\_forces** **(** [PhysicsDirectBodyState](class_physicsdirectbodystate.html#class-physicsdirectbodystate)
  state **)** virtual

Called during physics processing, allowing you to read and safely modify the simulation state for the object. By
default, it works in addition to the usual physics behavior, but the [custom_integrator](#property-custom-integrator)
property allows you to disable the default behavior and do fully custom force integration for a body.

***

* void **add\_central\_force** **(** [Vector3](class_vector3.html#class-vector3) force **)**

Adds a constant directional force (i.e. acceleration) without affecting rotation.

This is equivalent to `add_force(force, Vector3(0,0,0))`.

***

* void **add_force** **(** [Vector3](class_vector3.html#class-vector3)
  force, [Vector3](class_vector3.html#class-vector3) position **)**

Adds a constant directional force (i.e. acceleration).

The position uses the rotation of the global coordinate system, but is centered at the object's origin.

***

* void **add_torque** **(** [Vector3](class_vector3.html#class-vector3) torque **)**

Adds a constant rotational force (i.e. a motor) without affecting position.

***

* void **apply\_central\_impulse** **(** [Vector3](class_vector3.html#class-vector3) impulse **)**

Applies a directional impulse without affecting rotation.

This is equivalent to `apply_impulse(Vector3(0,0,0), impulse)`.

***

* void **apply_impulse** **(** [Vector3](class_vector3.html#class-vector3)
  position, [Vector3](class_vector3.html#class-vector3) impulse **)**

Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result
in a framerate-dependent force. For this reason it should only be used when simulating one-time impacts. The position
uses the rotation of the global coordinate system, but is centered at the object's origin.

***

* void **apply\_torque\_impulse** **(** [Vector3](class_vector3.html#class-vector3) impulse **)**

Applies a torque impulse which will be affected by the body mass and shape. This will rotate the body around
the `impulse` vector passed.

***

* [bool](class_bool.html#class-bool) **
  get\_axis\_lock** **(** [BodyAxis](class_physicsserver.html#enum-physicsserver-bodyaxis) axis **)** const

Returns `true` if the specified linear or rotational axis is locked.

***

* [Array](class_array.html#class-array) **get\_colliding\_bodies** **(** **)** const

Returns a list of the bodies colliding with this one. Requires [contact_monitor](#property-contact-monitor) to be set
to `true` and [contacts_reported](#property-contacts-reported) to be set high enough to detect all the collisions.

**Note:** The result of this test is not immediate after moving objects. For performance, list of collisions is updated
once per frame and before the physics step. Consider using signals instead.

***

* [Basis](class_basis.html#class-basis) **get\_inverse\_inertia_tensor** **(** **)**

Returns the inverse inertia tensor basis. This is used to calculate the angular acceleration resulting from a torque
applied to the RigidBody.

***

* void **set\_axis\_lock** **(** [BodyAxis](class_physicsserver.html#enum-physicsserver-bodyaxis)
  axis, [bool](class_bool.html#class-bool) lock **)**

Locks the specified linear or rotational axis.

***

* void **set\_axis\_velocity** **(** [Vector3](class_vector3.html#class-vector3) axis_velocity **)**

Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for
jumping behavior.