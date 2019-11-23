package other
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	
	public class Tips extends Sprite
	{
		public var BrightFilter:ColorMatrixFilter = new ColorMatrixFilter();
		public var FlashCount:Number = 0;
		public var ifFleshing:Boolean = false;
		public var preFleshing:Boolean = false;
		
		public var Bg:Image;
		public var Word:Image;
		public var Word2:Image;
		
		public var explodeFrameCount:uint = 0;
		public var EndexplodeFrame:uint = 0;
		public function Tips(Name:String , explodeFrame:int = -1)
		{
			Bg = new Image(Assets.getTexture("BlackSquare"));
			Word2 = new Image(Assets.getTexture(Name));
			Bg.width = 800;
			Bg.height = 231;
			var CF:ColorMatrixFilter = new ColorMatrixFilter().tint(0,1);
			Word2.filter = CF;
			addChild(Bg);
			Bg.alpha = 0.46;
			addChild(Word2);
			Word2.alpha = 0.5;
			Word = new Image(Assets.getTexture(Name));
			Word.x = 400 - Word.width/2;
			Word.y = 115 - Word.height/2;
			Word2.x = 400 - Word.width/2+6;
			Word2.y = 115 - Word.height/2+6;
			addChild(Word);
			y = 369;
			
			if(explodeFrame != -1)
			{
				EndexplodeFrame = explodeFrame;
				addEventListener(Event.ENTER_FRAME, Last);
			}
			//Flash();
		}
		private function Last(e:Event):void
		{
			explodeFrameCount++;
			if(explodeFrameCount > EndexplodeFrame)
			{
				parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, Last);
			}
		}
	}
}