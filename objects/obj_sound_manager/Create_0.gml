/// @description Insert description here
// You can write your code in this editor
ini_open("player.ini");
global.sound_master = ini_read_real("sound", "master", 1);
ini_close();