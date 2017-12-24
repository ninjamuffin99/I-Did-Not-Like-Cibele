package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_gn_killgothic_u_kanao_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/GN-KillGothic-U-KanaO.ttf", __ASSET__assets_data_gn_killgothic_u_kanao_ttf);
		type.set ("assets/data/GN-KillGothic-U-KanaO.ttf", AssetType.FONT);
		className.set ("assets/images/cyberpunk-street.png", __ASSET__assets_images_cyberpunk_street_png);
		type.set ("assets/images/cyberpunk-street.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/splashScreen.png", __ASSET__assets_images_splashscreen_png);
		type.set ("assets/images/splashScreen.png", AssetType.IMAGE);
		className.set ("assets/music/AlbumArtSmall.jpg", __ASSET__assets_music_albumartsmall_jpg);
		type.set ("assets/music/AlbumArtSmall.jpg", AssetType.IMAGE);
		className.set ("assets/music/creditsStuff.aup", __ASSET__assets_music_creditsstuff_aup);
		type.set ("assets/music/creditsStuff.aup", AssetType.TEXT);
		className.set ("assets/music/creditsStuff.mp3", __ASSET__assets_music_creditsstuff_mp3);
		type.set ("assets/music/creditsStuff.mp3", AssetType.MUSIC);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000004.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000004_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000004.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000013b.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000013b_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000013b.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000018a.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000018a_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000018a.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00001c5.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00001c5_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00001c5.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00001e5.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00001e5_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00001e5.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000206.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000206_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000206.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000020e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000020e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000020e.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000021e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000021e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000021e.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000024e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000024e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000024e.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000285.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000285_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000285.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00002a1.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00002a1_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00002a1.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003bc.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003bc_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003bc.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003cb.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003cb_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003cb.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003e8.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003e8_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003e8.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003fb.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003fb_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003fb.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00004b4.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00004b4_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00004b4.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00004d9.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00004d9_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00004d9.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000513.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000513_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000513.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00005e3.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00005e3_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00005e3.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00005fa.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00005fa_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00005fa.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000740.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000740_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000740.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00007bd.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00007bd_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00007bd.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00007c3.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00007c3_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00007c3.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000080e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000080e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000080e.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000893.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000893_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000893.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000898.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000898_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000898.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e00008de.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00008de_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00008de.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e000092f.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000092f_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000092f.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000931.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000931_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000931.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000944.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000944_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000944.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000a2c.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a2c_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000a2c.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000a7e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a7e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000a7e.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000a97.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a97_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000a97.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000b08.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b08_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000b08.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000b54.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b54_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000b54.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000b73.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b73_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000b73.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c0d.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c0d_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c0d.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c10.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c10_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c10.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c23.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c23_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c23.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c2b.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c2b_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c2b.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c41.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c41_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c41.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c6f.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c6f_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c6f.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000ca0.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000ca0_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000ca0.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000cb9.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000cb9_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000cb9.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000d06.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d06_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000d06.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000d48.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d48_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000d48.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000dd9.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000dd9_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000dd9.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000de5.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000de5_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000de5.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000e54.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000e54_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000e54.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000eed.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000eed_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000eed.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000f72.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000f72_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000f72.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000feb.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000feb_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000feb.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001271.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001271_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001271.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001449.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001449_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001449.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001a25.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001a25_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001a25.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001b3f.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001b3f_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001b3f.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001d75.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001d75_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001d75.au", AssetType.TEXT);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001e0f.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001e0f_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001e0f.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001f0e.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001f0e_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001f0e.au", AssetType.BINARY);
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001fa5.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001fa5_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001fa5.au", AssetType.BINARY);
		className.set ("assets/music/cuddle_love_short1_ofv.mp3", __ASSET__assets_music_cuddle_love_short1_ofv_mp3);
		type.set ("assets/music/cuddle_love_short1_ofv.mp3", AssetType.MUSIC);
		className.set ("assets/music/Folder.jpg", __ASSET__assets_music_folder_jpg);
		type.set ("assets/music/Folder.jpg", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/GN-KillGothic-U-KanaO.ttf";
		className.set (id, __ASSET__assets_data_gn_killgothic_u_kanao_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/cyberpunk-street.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/splashScreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/AlbumArtSmall.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/creditsStuff.aup";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/creditsStuff_data/e00/d00/e0000004.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e000013b.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e000018a.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00001c5.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00001e5.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000206.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e000020e.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e000021e.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e000024e.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000285.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00002a1.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e00003bc.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e00003cb.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e00003e8.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e00003fb.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00004b4.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00004d9.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000513.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00005e3.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e00005fa.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000740.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00007bd.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e00007c3.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e000080e.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000893.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000898.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e00008de.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e000092f.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000931.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000944.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000a2c.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000a7e.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000a97.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000b08.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000b54.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000b73.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000c0d.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000c10.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000c23.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000c2b.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000c41.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000c6f.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000ca0.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000cb9.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000d06.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000d48.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000dd9.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000de5.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000e54.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000eed.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d00/e0000f72.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d00/e0000feb.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d01/e0001271.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d01/e0001449.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d01/e0001a25.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d01/e0001b3f.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d01/e0001d75.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/creditsStuff_data/e00/d01/e0001e0f.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d01/e0001f0e.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/creditsStuff_data/e00/d01/e0001fa5.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/cuddle_love_short1_ofv.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Folder.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/GN-KillGothic-U-KanaO.ttf", __ASSET__assets_data_gn_killgothic_u_kanao_ttf);
		type.set ("assets/data/GN-KillGothic-U-KanaO.ttf", AssetType.FONT);
		
		className.set ("assets/images/cyberpunk-street.png", __ASSET__assets_images_cyberpunk_street_png);
		type.set ("assets/images/cyberpunk-street.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/splashScreen.png", __ASSET__assets_images_splashscreen_png);
		type.set ("assets/images/splashScreen.png", AssetType.IMAGE);
		
		className.set ("assets/music/AlbumArtSmall.jpg", __ASSET__assets_music_albumartsmall_jpg);
		type.set ("assets/music/AlbumArtSmall.jpg", AssetType.IMAGE);
		
		className.set ("assets/music/creditsStuff.aup", __ASSET__assets_music_creditsstuff_aup);
		type.set ("assets/music/creditsStuff.aup", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff.mp3", __ASSET__assets_music_creditsstuff_mp3);
		type.set ("assets/music/creditsStuff.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000004.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000004_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000004.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000013b.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000013b_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000013b.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000018a.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000018a_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000018a.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00001c5.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00001c5_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00001c5.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00001e5.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00001e5_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00001e5.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000206.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000206_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000206.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000020e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000020e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000020e.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000021e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000021e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000021e.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000024e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000024e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000024e.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000285.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000285_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000285.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00002a1.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00002a1_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00002a1.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003bc.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003bc_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003bc.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003cb.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003cb_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003cb.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003e8.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003e8_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003e8.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00003fb.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00003fb_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00003fb.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00004b4.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00004b4_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00004b4.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00004d9.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00004d9_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00004d9.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000513.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000513_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000513.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00005e3.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00005e3_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00005e3.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00005fa.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00005fa_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00005fa.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000740.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000740_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000740.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00007bd.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00007bd_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00007bd.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00007c3.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00007c3_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00007c3.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000080e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000080e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000080e.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000893.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000893_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000893.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000898.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000898_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000898.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e00008de.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e00008de_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e00008de.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e000092f.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e000092f_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e000092f.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000931.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000931_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000931.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000944.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000944_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000944.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000a2c.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a2c_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000a2c.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000a7e.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a7e_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000a7e.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000a97.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a97_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000a97.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000b08.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b08_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000b08.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000b54.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b54_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000b54.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000b73.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b73_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000b73.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c0d.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c0d_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c0d.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c10.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c10_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c10.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c23.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c23_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c23.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c2b.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c2b_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c2b.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c41.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c41_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c41.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000c6f.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c6f_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000c6f.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000ca0.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000ca0_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000ca0.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000cb9.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000cb9_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000cb9.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000d06.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d06_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000d06.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000d48.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d48_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000d48.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000dd9.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000dd9_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000dd9.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000de5.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000de5_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000de5.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000e54.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000e54_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000e54.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000eed.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000eed_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000eed.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000f72.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000f72_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000f72.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d00/e0000feb.au", __ASSET__assets_music_creditsstuff_data_e00_d00_e0000feb_au);
		type.set ("assets/music/creditsStuff_data/e00/d00/e0000feb.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001271.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001271_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001271.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001449.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001449_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001449.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001a25.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001a25_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001a25.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001b3f.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001b3f_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001b3f.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001d75.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001d75_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001d75.au", AssetType.TEXT);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001e0f.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001e0f_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001e0f.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001f0e.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001f0e_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001f0e.au", AssetType.BINARY);
		
		className.set ("assets/music/creditsStuff_data/e00/d01/e0001fa5.au", __ASSET__assets_music_creditsstuff_data_e00_d01_e0001fa5_au);
		type.set ("assets/music/creditsStuff_data/e00/d01/e0001fa5.au", AssetType.BINARY);
		
		className.set ("assets/music/cuddle_love_short1_ofv.mp3", __ASSET__assets_music_cuddle_love_short1_ofv_mp3);
		type.set ("assets/music/cuddle_love_short1_ofv.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/Folder.jpg", __ASSET__assets_music_folder_jpg);
		type.set ("assets/music/Folder.jpg", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_gn_killgothic_u_kanao_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_images_cyberpunk_street_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_splashscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_albumartsmall_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_aup extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000004_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000013b_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000018a_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00001c5_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00001e5_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000206_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000020e_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000021e_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000024e_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000285_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00002a1_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003bc_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003cb_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003e8_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003fb_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00004b4_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00004d9_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000513_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00005e3_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00005fa_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000740_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00007bd_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00007c3_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000080e_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000893_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000898_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00008de_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000092f_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000931_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000944_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a2c_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a7e_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a97_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b08_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b54_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b73_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c0d_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c10_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c23_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c2b_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c41_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c6f_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000ca0_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000cb9_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d06_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d48_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000dd9_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000de5_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000e54_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000eed_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000f72_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000feb_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001271_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001449_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001a25_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001b3f_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001d75_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001e0f_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001f0e_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001fa5_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_cuddle_love_short1_ofv_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_folder_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5


@:keep #if display private #end class __ASSET__assets_data_gn_killgothic_u_kanao_ttf extends lime.text.Font { public function new () { super (); name = "GN-KMBFont-UB-OldstyleKana"; } } 








































































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:font("assets/data/GN-KillGothic-U-KanaO.ttf") #if display private #end class __ASSET__assets_data_gn_killgothic_u_kanao_ttf extends lime.text.Font {}
@:image("assets/images/cyberpunk-street.png") #if display private #end class __ASSET__assets_images_cyberpunk_street_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/splashScreen.png") #if display private #end class __ASSET__assets_images_splashscreen_png extends lime.graphics.Image {}
@:image("assets/music/AlbumArtSmall.jpg") #if display private #end class __ASSET__assets_music_albumartsmall_jpg extends lime.graphics.Image {}
@:file("assets/music/creditsStuff.aup") #if display private #end class __ASSET__assets_music_creditsstuff_aup extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff.mp3") #if display private #end class __ASSET__assets_music_creditsstuff_mp3 extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000004.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000004_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000013b.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000013b_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000018a.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000018a_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00001c5.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00001c5_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00001e5.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00001e5_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000206.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000206_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000020e.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000020e_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000021e.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000021e_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000024e.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000024e_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000285.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000285_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00002a1.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00002a1_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00003bc.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003bc_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00003cb.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003cb_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00003e8.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003e8_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00003fb.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00003fb_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00004b4.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00004b4_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00004d9.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00004d9_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000513.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000513_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00005e3.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00005e3_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00005fa.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00005fa_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000740.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000740_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00007bd.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00007bd_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00007c3.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00007c3_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000080e.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000080e_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000893.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000893_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000898.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000898_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e00008de.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e00008de_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e000092f.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e000092f_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000931.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000931_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000944.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000944_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000a2c.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a2c_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000a7e.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a7e_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000a97.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000a97_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000b08.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b08_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000b54.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b54_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000b73.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000b73_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000c0d.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c0d_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000c10.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c10_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000c23.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c23_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000c2b.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c2b_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000c41.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c41_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000c6f.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000c6f_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000ca0.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000ca0_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000cb9.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000cb9_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000d06.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d06_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000d48.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000d48_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000dd9.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000dd9_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000de5.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000de5_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000e54.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000e54_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000eed.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000eed_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000f72.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000f72_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d00/e0000feb.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d00_e0000feb_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001271.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001271_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001449.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001449_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001a25.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001a25_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001b3f.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001b3f_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001d75.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001d75_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001e0f.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001e0f_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001f0e.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001f0e_au extends lime.utils.Bytes {}
@:file("assets/music/creditsStuff_data/e00/d01/e0001fa5.au") #if display private #end class __ASSET__assets_music_creditsstuff_data_e00_d01_e0001fa5_au extends lime.utils.Bytes {}
@:file("assets/music/cuddle_love_short1_ofv.mp3") #if display private #end class __ASSET__assets_music_cuddle_love_short1_ofv_mp3 extends lime.utils.Bytes {}
@:image("assets/music/Folder.jpg") #if display private #end class __ASSET__assets_music_folder_jpg extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_data_gn_killgothic_u_kanao_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_data_gn_killgothic_u_kanao_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end