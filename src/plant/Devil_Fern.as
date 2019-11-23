package plant
{

	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.core.Starling;

	public class Devil_Fern extends Plant
	{
		public var Showingframes:Vector.<Texture>;
		public function Devil_Fern()
		{
			AttackChange="NoAttack";
			BeAttackRangex=9.8;
			BeAttackRangey=12.6;
			BeAttackRangewidth=48.2;
			BeAttackRangeheight=50.8;
			life=320;
			//var bitmap:Bitmap = new Devil_FernBitmap();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new Devil_FernXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			Showingframes = Assets.getTextures("Devil_Fern","Devil_FernXML","Devil_Fern");
			mMovie = new MovieClip(Showingframes, 24);
			mMovie.x = 0;
			mMovie.y = 0;
			Show();
		}
		public function Show(fps:uint=24):void
		{
			addChild ( mMovie );
			Starling.juggler.add(mMovie);
		}
		public function Grow(fps:uint=24):void
		{
			addChild ( mMovie );
			Starling.juggler.add(mMovie);
		}
	}
}