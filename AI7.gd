extends VehicleBody3D

var points = [
Vector3(-185.708, 58.59032, -77.506),
Vector3(-185.708, 57.26633, -77.506),
Vector3(-185.708, 55.05976, -77.506),
Vector3(-185.708, 51.98957, -77.506),
Vector3(-185.708, 48.07428, -77.506),
Vector3(-185.6197, 47.6529, -77.60471),
Vector3(-185.5594, 47.64465, -77.8923),
Vector3(-185.5242, 47.64562, -78.22178),
Vector3(-185.4642, 47.6472, -78.75092),
Vector3(-185.2951, 47.65114, -79.46172),
Vector3(-185.1531, 47.65605, -80.33392),
Vector3(-184.951, 47.66254, -81.48844),
Vector3(-184.7448, 47.66967, -82.7547),
Vector3(-184.5649, 47.67766, -84.16609),
Vector3(-184.2853, 47.68739, -85.92338),
Vector3(-183.9517, 47.69944, -88.05868),
Vector3(-183.7269, 47.71235, -90.31596),
Vector3(-183.5292, 47.72577, -92.66893),
Vector3(-183.2845, 47.74063, -95.2795),
Vector3(-183.0142, 47.75759, -98.25593),
Vector3(-182.7218, 47.7766, -101.5905),
Vector3(-182.422, 47.79755, -105.262),
Vector3(-182.2291, 47.81903, -109.008),
Vector3(-181.9963, 47.84237, -113.0839),
Vector3(-181.7582, 47.86766, -117.4952),
Vector3(-181.592, 47.89207, -122.0986),
Vector3(-181.4333, 47.90066, -126.9441),
Vector3(-181.2806, 47.91055, -132.1154),
Vector3(-181.0268, 47.92253, -137.5187),
Vector3(-180.7527, 47.93448, -143.145),
Vector3(-180.4833, 47.94707, -149.0763),
Vector3(-180.2204, 47.96032, -155.3063),
Vector3(-179.9662, 47.9742, -161.8286),
Vector3(-179.7228, 47.9887, -168.6368),
Vector3(-179.4748, 48.00173, -175.7195),
Vector3(-178.9359, 48.01298, -182.8584),
Vector3(-178.2335, 48.01957, -190.1349),
Vector3(-176.9143, 48.02551, -197.2056),
Vector3(-175.3652, 48.0309, -204.2924),
Vector3(-173.7135, 48.0356, -211.5106),
Vector3(-172.0304, 48.04171, -218.9938),
Vector3(-170.3147, 48.04803, -226.7383),
Vector3(-168.5692, 48.05459, -234.739),
Vector3(-166.8254, 48.06236, -242.9656),
Vector3(-165.3066, 48.07048, -251.1545),
Vector3(-163.7551, 48.07889, -259.5782),
Vector3(-162.1875, 48.0876, -268.2457),
Vector3(-160.6061, 48.09655, -277.152),
Vector3(-158.8453, 48.10549, -286.1637),
Vector3(-156.7861, 48.11419, -295.1163),
Vector3(-154.2516, 48.1227, -303.8739),
Vector3(-151.7115, 48.13308, -312.8521),
Vector3(-149.1394, 48.14397, -322.0554),
Vector3(-146.3948, 48.15487, -331.3554),
Vector3(-143.277, 48.16398, -340.496),
Vector3(-139.9269, 48.17559, -349.5739),
Vector3(-136.4466, 48.18567, -358.6943),
Vector3(-132.8972, 48.19638, -368.0007),
Vector3(-129.1311, 48.20771, -377.2662),
Vector3(-125.0931, 48.2187, -386.4131),
Vector3(-120.7773, 48.22783, -395.4329),
Vector3(-116.2812, 48.23829, -404.4099),
Vector3(-111.5604, 48.2485, -413.3058),
Vector3(-106.5354, 48.25834, -421.9877),
Vector3(-101.2408, 48.26799, -430.4629),
Vector3(-95.78249, 48.27744, -438.9186),
Vector3(-90.10925, 48.2868, -447.2685),
Vector3(-84.25277, 48.29575, -455.5287),
Vector3(-78.18254, 48.30436, -463.6432),
Vector3(-71.88372, 48.31252, -471.5547),
Vector3(-65.41385, 48.32115, -479.4057),
Vector3(-58.85416, 48.33069, -487.4323),
Vector3(-52.17838, 48.34033, -495.5965),
Vector3(-45.32221, 48.35008, -503.6566),
Vector3(-38.29375, 48.35927, -511.6109),
Vector3(-31.13164, 48.36835, -519.5447),
Vector3(-23.78741, 48.37755, -527.3153),
Vector3(-16.28107, 48.38659, -534.956),
Vector3(-8.605336, 48.39558, -542.5091),
Vector3(-0.784377, 48.40416, -549.9585),
Vector3(7.186635, 48.41254, -557.3312),
Vector3(15.32283, 48.41993, -564.517),
Vector3(23.59693, 48.42855, -571.5883),
Vector3(31.9925, 48.43649, -578.6194),
Vector3(40.55691, 48.44367, -585.4385),
Vector3(49.26305, 48.45087, -592.0889),
Vector3(58.08838, 48.4579, -598.6914),
Vector3(67.05206, 48.46511, -605.2263),
Vector3(76.1393, 48.47501, -611.6024),
Vector3(85.34879, 48.48293, -617.887),
Vector3(94.69141, 48.48997, -623.9749),
Vector3(104.1547, 48.49707, -629.8274),
Vector3(113.7239, 48.50392, -635.5694),
Vector3(123.4096, 48.5103, -641.1952),
Vector3(133.2093, 48.51757, -646.6752),
Vector3(143.1311, 48.52461, -651.8548),
Vector3(153.1609, 48.53041, -656.5372),
Vector3(163.2777, 48.5354, -660.7753),
Vector3(173.4926, 48.53994, -664.7851),
Vector3(183.7938, 48.54412, -667.952),
Vector3(194.1603, 48.54832, -670.8297),
Vector3(204.5895, 48.55188, -673.4619),
Vector3(215.0796, 48.55528, -675.877),
Vector3(225.6283, 48.55825, -678.075),
Vector3(236.2552, 48.56086, -680.0798),
Vector3(246.9613, 48.56569, -681.931),
Vector3(257.7108, 48.57029, -683.5602),
Vector3(268.5092, 48.57122, -684.9787),
Vector3(279.2495, 48.57866, -685.9531),
Vector3(289.7783, 48.58014, -685.9771),
Vector3(300.3251, 48.58118, -685.7603),
Vector3(311.0694, 48.58305, -685.5706),
Vector3(321.8194, 48.58382, -685.1079),
Vector3(332.4572, 48.58408, -684.1863),
Vector3(343.1064, 48.58372, -683.072),
Vector3(353.9042, 48.58334, -681.9374),
Vector3(364.7506, 48.5826, -680.6304),
Vector3(375.6518, 48.58331, -679.1661),
Vector3(386.5071, 48.5851, -677.466),
Vector3(397.4445, 48.58516, -675.6816),
Vector3(408.2148, 48.58576, -673.423),
Vector3(418.4724, 48.58447, -670.2589),
Vector3(428.686, 48.58279, -666.8973),
Vector3(438.8249, 48.57808, -663.2883),
Vector3(448.8174, 48.57305, -659.3897),
Vector3(458.7005, 48.57213, -655.2471),
Vector3(468.6202, 48.56879, -650.9813),
Vector3(478.4809, 48.5651, -646.5165),
Vector3(488.1752, 48.56083, -641.7828),
Vector3(497.737, 48.55643, -636.8144),
Vector3(507.0812, 48.55375, -631.5554),
Vector3(516.1237, 48.56133, -625.9806),
Vector3(524.83, 48.56944, -620.0837),
Vector3(533.2411, 48.57601, -613.8861),
Vector3(541.2708, 48.58077, -607.3638),
Vector3(548.9278, 48.5838, -600.5421),
Vector3(555.6524, 48.58345, -593.1475),
Vector3(561.3728, 48.57973, -585.2792),
Vector3(567.0484, 48.60434, -577.2794),
Vector3(572.7685, 48.64727, -569.1308),
Vector3(578.2643, 48.6879, -560.8188),
Vector3(583.033, 48.72141, -552.2587),
Vector3(587.8779, 48.75541, -543.5616),
Vector3(592.8621, 48.7736, -534.6788),
Vector3(597.9886, 48.76793, -525.6084),
Vector3(603.2316, 48.79388, -516.399),
Vector3(608.5948, 48.82724, -507.0417),
Vector3(614.0834, 48.8616, -497.5328),
Vector3(619.696, 48.89697, -487.8769),
Vector3(625.4506, 48.90182, -478.0467),
Vector3(631.3229, 48.92696, -468.087),
Vector3(637.306, 48.96293, -458.0059)
]

var x = 0
var look_ahead_distance = 5.0
var look_ahead_speed_factor = 0.2
var max_steering_angle = deg_to_rad(30.0)
var steering_angle = 0.0

var desired_velocity = 50.0
var max_engine_force = 1000.0
var velocity_gain = 40.0
var min_velocity_in_turn = 20.0
var turn_sensitivity_threshold = 0.1

# Pure Pursuit parameters
var look_ahead_multiplier = 1.0
var k = 2  # Steering gain

func _physics_process(delta):
	var b = global_transform.origin
	var a = points[x]

	# Calculate distance to the current target point
	var distance = b.distance_to(a)
	
	# Update to the next point if close enough to the current target
	if distance < look_ahead_distance:
		x += 1
		if x >= points.size():
			x = 0

	# Calculate dynamic look-ahead distance based on current speed
	var speed = linear_velocity.length()
	var dynamic_look_ahead_distance = look_ahead_distance + (speed * look_ahead_speed_factor)
	
	# Find the look-ahead point
	var look_ahead_point = find_look_ahead_point(b, dynamic_look_ahead_distance)
	
	# Calculate the steering angle using Pure Pursuit
	steering_angle = calculate_pure_pursuit_steering(b, look_ahead_point)
	
	# Apply the calculated steering angle
	steering = clamp(steering_angle, -max_steering_angle, max_steering_angle)
	
	# Maintain a constant velocity
	adjust_engine_force_to_maintain_velocity()

	print("Steering Angle: ", steering)
	print("Target Point Index: ", x)
	print("Engine Force: ", engine_force)


func find_look_ahead_point(current_position: Vector3, look_ahead_distance: float) -> Vector3:
	# Find the point at look_ahead_distance along the path
	var min_distance = float('inf')
	var look_ahead_point = points[0]
	
	for i in range(x, points.size()):
		var point = points[i]
		var distance = current_position.distance_to(point)
		if distance >= look_ahead_distance and distance < min_distance:
			min_distance = distance
			look_ahead_point = point
			
	return look_ahead_point


func calculate_pure_pursuit_steering(current_position: Vector3, look_ahead_point: Vector3) -> float:
	# Calculate steering angle using Pure Pursuit
	var to_look_ahead = look_ahead_point - current_position
	var forward_direction = global_transform.basis.z.normalized()
	var angle_to_target = atan2(to_look_ahead.x, to_look_ahead.z)
	var car_heading = atan2(forward_direction.x, forward_direction.z)
	var steering_angle = angle_to_target - car_heading
	
	return k * steering_angle


func adjust_engine_force_to_maintain_velocity():
	# Calculate the current speed
	var current_speed = linear_velocity.length()
	
	# Calculate the difference between desired velocity and current speed
	var speed_error = desired_velocity - current_speed

	# Adjust engine force proportionally to the speed error
	engine_force = clamp(speed_error * velocity_gain, -max_engine_force, max_engine_force)
