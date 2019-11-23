package background
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	//import starling.
	public class BackGround_Dream_BackGround extends Sprite
	{
		//private var ObjectVector:Vector.<Image> = new Vector.<Image>(1, true);
		public function BackGround_Dream_BackGround()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded); 
		}
		private function onAdded (e:Event):void
		{
			var image:Image = new Image(Assets.getTexture("Dream_BackGround_Background"));
			image.x = 0;
			image.y = 0;
			//ObjectVector[0] = image;
			texture=null;
			//image=null;
			//ObjectBitmap=null; 
			var filter:ColorMatrixFilter = new ColorMatrixFilter();
			/*filter.invert();
			filter.adjustSaturation(1);//-0.5);
			filter.adjustHue(1.0);
			filter.adjustBrightness(1);*/
			Filter.tint(0xFFFF00, 1);
			image.filter = Filter;
			addChild(image);
			//this.blendMode = BlendMode.ADD;
			//this.touchable=false;
			//this.flatten();
		}
	}
}