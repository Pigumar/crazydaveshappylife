// ActionScript file
//private var Numbers:Vector.<Texture> = new TextureAtlas(Texture.fromBitmap(new NumberSheet()), XML(new NumberSheetXML())).getTextures("SunVaseNumber");
package other
{
	//import flash.display.Bitmap;

	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	public class Sun_Drop extends Sprite
	{
		public var speed:uint;
		private var Frames:Vector.<Texture> =Assets.getTextures("SunLight","SunLightXML","SunLight");
		
		private var mMovie:MovieClip;
		private var CollectX:Number,CollectY:Number,dalpha:Number,collecttype:uint;
		private var CollectCount:uint=0;
		private var DropTime:Number;
		private var LifeCount:uint=0;
		private var Num:uint;
		public function Sun_Drop(num:uint)
		{
			Num=num;
			addEventListener(Event.ADDED_TO_STAGE, onAdded); 
		}
		private function onAdded(e:Event):void
		{
			x=400;
			mMovie = new MovieClip(Frames, 24);
			Frames=null;
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			Starling.juggler.add(mMovie);
			addEventListener(TouchEvent.TOUCH,Collect);
		}
		public function Drop():void
		{
			x=Math.ceil(Math.random()*682-16);
			y=-118;
			DropTime=Math.ceil((Math.random()*24+72));
			addEventListener(Event.ENTER_FRAME,DropFrame);
		}
		private function DropFrame(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				LifeCount++;
				DropTime-=0.5;
				if(DropTime>0)
					y+=2.5;
				if(DropTime<0)
				{
					removeEventListener(Event.ENTER_FRAME,DropFrame);
					//GestureCount=26;
					LifeCount=0;
					//play();
					//LastTimer.start();
					addEventListener(Event.ENTER_FRAME,Last);
					//DropTimer.removeEventListener(TimerEvent.TIMER,DropFrame);
					return;
				}
				c++;
			}
		}
		private function Last(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				LifeCount++;
				if(LifeCount>=300)
				{
					LifeCount=300;
					removeEventListener(Event.ENTER_FRAME,Last);
					removeEventListener(TouchEvent.TOUCH,Collect);
					//removeChild(mMovie);
					//mMovie.dispose();
					//mMovie=null;
					//mMovie=parent.Sun_DropMovie;
					//addChild(mMovie);
					//mMovie.x=-119;
					//mMovie.y=-119;
					//Starling.juggler.add(mMovie);
					addEventListener(Event.ENTER_FRAME,DisappearFrame);
					return;
				}
				c++;
			}
		}
		private function DisappearFrame(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				LifeCount++;
				alpha-=0.067;
				if(LifeCount>=315)
				{
					Starling.juggler.remove(mMovie);
					removeChild(mMovie);
					mMovie.dispose();
					mMovie=null;
					removeEventListener(Event.ENTER_FRAME,DisappearFrame);
					parent.clearSun(Num,0);
					return;
				}
				c++;
			}
		}
		private function Collect(event:TouchEvent):void
		{
			removeEventListener(TouchEvent.TOUCH,Collect);
			removeEventListener(Event.ENTER_FRAME,DropFrame);
			CollectCount=0;
		    Starling.juggler.remove(mMovie);
			CollectX=(x-50)/24;
			CollectY=(y-27)/24;
			collecttype=23;
			if((x*x+y*y)>=106450)
			{
				CollectX=(x-50)/36;
				CollectY=(y-27)/36;
				collecttype=35;
			}
			if((x*x+y*y)>=213160)
			{
				CollectX=(x-50)/48;
				CollectY=(y-27)/48;
				collecttype=47;
			}
			if((x*x+y*y)>=350649)
			{
				CollectX=(x-50)/60;
				CollectY=(y-27)/60;
				collecttype=59;
			}
			if((x*x+y*y)>=530896)
			{
				CollectX=(x-50)/72;
				CollectY=(y-27)/72;
				collecttype=71;
			}
			if((x*x+y*y)>=762074)
			{
				CollectX=(x-50)/84;
				CollectY=(y-27)/84;
				collecttype=83;
			}
			dalpha=0.5/collecttype;
			addEventListener(Event.ENTER_FRAME,CollectFrame);
		}
	    private function CollectFrame(e:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				if(this.mMovie.isPlaying)
					Starling.juggler.remove(mMovie);
				var Count:uint=0;
				while(Count<2)
				{
					CollectCount++;
					x-=CollectX;
					y-=CollectY;
					mMovie.alpha-=dalpha;
					if(CollectCount==collecttype)
					{
						removeEventListener(Event.ENTER_FRAME,CollectFrame);
						this.visible=false;
						parent.clearSun(Num,50);
					}
					Count++;
				}
				c++;
			}
		}
	}
}