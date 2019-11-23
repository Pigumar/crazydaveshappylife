package plant
{
	import flash.display.Bitmap;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class WallNut extends Plant
	{
		public var Showingframes:Vector.<Texture>;
		public var Charred1frames:Vector.<Texture>;
		public var Charred2frames:Vector.<Texture>;
		
		
		public function WallNut()
		{
			AttackChange="NoAttack";
			BeAttackRangex=9.8;
			BeAttackRangey=12.6;
			BeAttackRangewidth=48.2;
			BeAttackRangeheight=50.8;
			life=4000;
			Showingframes = Assets.getTextures("WallNut","WallNutXML","WallNut");//sTextureAtlas.getTextures("WallNut");
			mMovie = new MovieClip(Showingframes, 24);
			mMovie.x = 0;
			mMovie.y = 0;
			Charred1Framesinit();
			Charred2Framesinit();
			Show();
		}
		private function Charred1Framesinit():void
		{
			Charred1frames = Assets.getTextures("WallNut_Charred","WallNut_CharredXML","WallNut_Charred");
		}
		private function Charred2Framesinit():void
		{
			Charred2frames = Assets.getTextures("WallNut_Charred2","WallNut_Charred2XML","WallNut_CharredSecond");
		}
		public function Show(fps:uint=24):void
		{
			Starling.juggler.remove(mMovie);
			removeChild(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(Showingframes, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			this.GetFilter();
			Starling.juggler.add(mMovie);
		}
		public function Grow(fps:uint=24):void
		{
			Starling.juggler.remove(mMovie);
			removeChild(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(Showingframes, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			this.GetFilter();
			Starling.juggler.add(mMovie);
			addEventListener(Event.ENTER_FRAME,GrowFrame);
		}
		public function GrowFrame(e:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				if(!charred1&&life<=2700)
				{Charred1();}
				if(!charred2&&life<=1333)
				{Charred2();}
				c++;
			}
		}
		private var charred1:Boolean=false;
		private function Charred1(fps:uint=24):void
		{
			charred1=true;
			Starling.juggler.remove(mMovie);
			removeChild(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(Charred1frames, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 2;
			mMovie.y = -5;
			// show it
			addChild ( mMovie );
			this.GetFilter();
			Starling.juggler.add(mMovie);
		}
		private var charred2:Boolean=false;
		private function Charred2(fps:uint=24):void
		{
			BeAttackRangex=18.65;
			BeAttackRangey=21.7;
			BeAttackRangewidth=29;
			BeAttackRangeheight=42.8;
			charred2=true;
			Starling.juggler.remove(mMovie);
			removeChild(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(Charred2frames, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 5;
			mMovie.y = 11;
			// show it
			addChild ( mMovie );
			this.GetFilter();
			Starling.juggler.add(mMovie);
		}
	}
}