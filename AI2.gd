extends VehicleBody3D

var points = [
Vector3(-166.087, 54.3457, -143.132),
Vector3(-166.0116, 47.92819, -144.8022),
Vector3(-165.2904, 47.96135, -161.3729),
Vector3(-164.3161, 48.0152, -194.4396),
Vector3(-163.6086, 48.05956, -242.4399),
Vector3(-158.2533, 48.12057, -300.3246),
Vector3(-143.9654, 48.23403, -363.972),
Vector3(-113.1718, 48.31231, -418.7664),
Vector3(-69.98566, 48.3037, -466.1288),
Vector3(-19.44801, 48.36747, -522.5867),
Vector3(38.31543, 48.48039, -584.9816),
Vector3(105.0119, 48.55288, -630.7674),
Vector3(175.1707, 48.57689, -654.2461),
Vector3(248.8537, 48.53219, -664.459),
Vector3(332.9133, 48.58005, -676.6202),
Vector3(416.7726, 48.6418, -674.5157),
Vector3(490.0564, 48.63757, -652.1581),
Vector3(548.1948, 48.66858, -613.0908),
Vector3(586.9841, 48.81896, -562.1599),
Vector3(616.0997, 48.90489, -502.5797)
]

var b = Vector3(global_position)

var x = 0

var a = points[x]

var v3 = a - b

var distance = 99999999

var angle = 0

func _physics_process(delta):
	engine_force = 500
	distance = global_transform.origin.distance_to(a)
	if distance < 5:
		x += 1
	b = Vector3(global_position)
	a = points[x]
	v3 = a - b
	angle = atan2(v3.x, v3.z)
	steering = deg_to_rad(angle) * -1.2
	print(steering)
	print(x)
