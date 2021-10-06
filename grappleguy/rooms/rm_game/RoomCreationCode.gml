view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 384;
view_hport[0] = 256;
instance_create_layer(224, 782, "Player", obj_player);
with(obj_player)
{
		view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 288, 192);
}

layer_sequence_create("tile_background_assets", 120, 680, seq_start);

