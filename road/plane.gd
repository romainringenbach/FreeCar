extends Polygon2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dz = 0
var t = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dz+= delta*1000
	t += delta
	if dz > 540.0:
		dz -= 540.0
	self.material.set_shader_param("delta",Vector3(0.0,0.0,dz))
	
	var v = sin(t)
	
	#self.material.set_shader_param("X_y_a",Vector2(0.0,v))
	#self.material.set_shader_param("X_y_b",Vector2(-v/2.0,-4*v))
	
	var g = 0.0
	if v > 0.1:
		g = min(1.0,v+0.5)
	elif v < -0.1:
		g = max(-1.0,v-0.5)
	
	Physics2DServer.area_set_param(get_world_2d().get_space(), Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(0.0,1))
	
	
