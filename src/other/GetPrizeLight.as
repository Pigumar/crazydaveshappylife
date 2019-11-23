package other
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.deg2rad;
	
	public class GetPrizeLight extends Sprite
	{
		private var PrizeRayTexture:Texture = Assets.getTexture("PrizeLightTexture1");
		private var PrizeRayImage:Image = new Image(PrizeRayTexture);
		public function GetPrizeLight()
		{
			addChild(PrizeRayImage);
			PrizeRayImage.width = 2;
			PrizeRayImage.height = 2;
			PrizeRayImage.x = -1;
			PrizeRayImage.y = -1;
			addEventListener(Event.ENTER_FRAME, Continue);
		}
		private var BiggerCount:uint = 0;
		private function Continue(e:Event):void
		{
			BiggerCount ++;
			if(BiggerCount <= 24)
			{
				PrizeRayImage.x = -(PrizeRayImage.width/2);
				PrizeRayImage.y = -(PrizeRayImage.height/2);
				PrizeRayImage.width += 33.3;
				PrizeRayImage.height += 33.3;
				PrizeRayImage.alpha += 0.042;
			}
			PrizeRayImage.rotation += deg2rad(1.8);
		}
	}
}