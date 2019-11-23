package other
{
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class Bullet extends Sprite
	{
		private var image:Image;
		public var vx:int=12,vy:int=0;
		public var Num:int;
		public var ifexplode:Boolean=false;
		public var HurtValue:int=20;
		public var ExplodeMovie:MovieClip=null;
		public var speed:uint;
		public function Bullet(texture:Texture,VX:int,VY:int,num:int,ExplodeFrame:Vector.<Texture>=null, hurtvalue:uint=20)
		{
			image=new Image(texture);
			addChild(image);
			this.touchable=false;
			vx=VX;
			vy=VY;
			Num=num;
			if(ExplodeFrame!=null)
			ExplodeMovie=new MovieClip(ExplodeFrame,6);
			ExplodeFrame=null;
			//Fpss=ExplodeFrame.length;
			addEventListener(Event.ENTER_FRAME,Fly);
		}
		private function Fly(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				x+=vx;
				y+=vy;
				parent.Shadows[Num].x+=vx;
				parent.Shadows[Num].y+=vy;
				if(x>800||y>600||x<0||y<0)
				{
					parent.DisposeBullets(Num);
					return;
				}
				c++;
			}
		}
		//private var Movie:MovieClip;
		public function Explode():void
		{
			ifexplode=true;
			//Movie.x=0;
			//Movie.y=0;
			removeChild(image);
			image.dispose();
			image=null;
			Long=Long*4;
			//addChild(Movie);
			//Starling.juggler.add(Movie);
			if(ExplodeMovie!=null)
			{
				addChild(ExplodeMovie);Starling.juggler.add(ExplodeMovie);
			}
			removeEventListener(Event.ENTER_FRAME,Fly);
			addEventListener(Event.ENTER_FRAME,ExplodeFrame);
		}
		public var Long:int=0; 
		private function ExplodeFrame(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				Long--;
				if(Long<=1)
				{
					if(ExplodeMovie!=null)
					{
					    Starling.juggler.remove(ExplodeMovie);
					    removeChild(ExplodeMovie);
					    ExplodeMovie.dispose();
					    removeEventListener(Event.ENTER_FRAME,ExplodeFrame);
					}
					parent.DisposeBullets(Num);
					return;
				}
				c++;
			}
		}
	}
}