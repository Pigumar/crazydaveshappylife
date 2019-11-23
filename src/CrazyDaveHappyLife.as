package 
{ 
	import flash.display.Sprite; 
	import flash.display.StageAlign; 
	import flash.display.StageScaleMode;  
	import starling.core.Starling; 
	[SWF(width="800", height="600", frameRate="24", backgroundColor="#000000")] 
	public class CrazyDaveHappyLife extends Sprite 
	{ 
		private var mStarling:Starling; 
		public function CrazyDaveHappyLife() 
		{ 
			stage.align = StageAlign.TOP_LEFT; 
			stage.scaleMode = StageScaleMode.NO_SCALE; 
			mStarling = new Starling(Game, stage); 
			mStarling.antiAliasing = 1; 
			mStarling.start(); 
		} 
	} 
}