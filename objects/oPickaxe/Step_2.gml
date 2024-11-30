x = oPlayer.x + sign(oPlayer.image_xscale) * 9;
y = oPlayer.y + 9;


if (mouse_check_button_pressed(mb_left))
{
	angle =  startRot_FR
}

if (mouse_check_button(mb_left))
{
    angle = (angle - 1 * rotSpeed) % 360;
	
	//progress = 
	
	if (angle < endRot_FR && angle > startRot_FR)
	{
		angle = startRot_FR
	}
}

if (mouse_check_button_released(mb_left))
{
	angle = restRot
}

image_angle = angle * oPlayer.image_xscale
image_xscale = oPlayer.image_xscale
show_debug_message(angle)




/// GUN FROM PLATFORMER TUTORIAL
//image_angle = point_direction(x, y, mouse_x, mouse_y);

//firingdelay = firingdelay - 1;
//recoil = max(0, recoil - 1);

//if (mouse_check_button(mb_left)) && (firingdelay < 0)
//{
//	recoil = 4;
//	firingdelay = 5;
	
//	ScreenShake(2, 10);
	
//	with (instance_create_layer(x, y, "Bullets", oBullet))
//	{
//		speed = 25;
//		direction = other.image_angle + random_range(-10, 10);
//		image_angle = direction;
//	}
//}

//x = x - lengthdir_x(recoil, image_angle);
//y = y - lengthdir_y(recoil, image_angle);

//if (image_angle > 90) && (image_angle < 270)
//{
//	image_yscale = -1;
//}
//else
//{
//	image_yscale = 1;
//}
