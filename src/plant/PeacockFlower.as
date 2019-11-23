package plant
{
	
	import plant.Plant;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class PeacockFlower extends Plant
	{
		public var growcount:int=420;
		private var Showingframes:Vector.<Texture>;
		private var Producingframes:Vector.<Texture>;
		
		public function PeacockFlower()
		{
			AttackChange="NoAttack";
			BeAttackRangex=25.5;
			BeAttackRangey=39.5;
			BeAttackRangewidth=34.7;
			BeAttackRangeheight=50.8;
			life=320;
			Showingframesinit();
			Producingframesinit();
			mMovie = new MovieClip(Showingframes, 24);
			mMovie.x = 0;
			mMovie.y = 0;
			Show();
		}
		private function Showingframesinit():void
		{
			//var bitmap:Bitmap = new PeoCockFlowerBitmap();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new PeoCockFlowerXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			Showingframes = Assets.getTextures("PeaCockFlower","PeaCockFlowerXML","PeaCockFlower_Usual");
		}
		private function Producingframesinit():void
		{
			//var bitmap:Bitmap = new PeoCockFlowerBitmap();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new PeoCockFlowerXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			Producingframes = Assets.getTextures("PeaCockFlower","PeaCockFlowerXML","PeaCockFlower_Produsing");
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
			Producingframesinit();
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
				growcount++;
				if(growcount==547)
				{
					removeChild(mMovie);
					Starling.juggler.remove(mMovie);
					mMovie.dispose();
					mMovie = new MovieClip(Producingframes, 24);
					// show it
					addChild ( mMovie );
					this.GetFilter();
					Starling.juggler.add(mMovie);
					mMovie.loop = false;
				}
				if(mMovie.isComplete)
				{
					growcount=0;
					removeEventListener(Event.ENTER_FRAME,GrowFrame);
					Grow();
					return;
				}
				//gotoAndStop(gesturecount);
				if(growcount==555)
				{
					//trace("Producing");
					parent.PeacockFlowerJudge(1,x,y);
					return;
				}
				c++;
			}
		}
	}
}