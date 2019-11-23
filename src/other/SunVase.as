package other
{
	//import flash.display.Bitmap;
	
	import flash.display.Bitmap;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class SunVase extends Sprite
	{
		public var speed:uint// = parent.speed;
		public var sunEnergy:Number=0;
		//private var ObjectVector:Vector.<Image> = new Vector.<Image>(3, true);
		private var BackImage:Image=new Image(Assets.getTexture("SunVaseBack"));
		private var EnergyLayer1:Image=new Image(Assets.getTexture("SunVaseSunLightEnergy_Layer2"));
		private var EnergyLayer2:Image=new Image(Assets.getTexture("SunVaseSunLightEnergy_Layer1"));
		private var MiddleImage:Image=new Image(Assets.getTexture("SunVaseMiddle"));
		private var FrontImage:Image=new Image(Assets.getTexture("SunVaseFront"));
		private var HideImage:Image=null;
		private var Numbers:Vector.<Texture> = Assets.getTextures("SunVaseNumber","SunVaseNumberXML","SunVaseNumber");// new TextureAtlas(Texture.fromBitmap(new NumberSheet()), XML(new NumberSheetXML())).getTextures("SunVaseNumber");
		private var ShowNumber:Image=null;
		
		public function SunVase(store:uint,strHide:String)
		{
			sunEnergy = store;
			if(strHide == "DreamBackGround")
			{
				//hideClass = Assets.SunVaseEnergyHide_DreamGround;
			}
			addEventListener(Event.ADDED_TO_STAGE, onAdded); 
			this.touchable=false;
		}
		
		private function onAdded (e:Event):void
		{
			BackImage.x=0;
			BackImage.y=0;
			MiddleImage.x=0;
			MiddleImage.y=0;
			FrontImage.x=0;
			FrontImage.y=0;
			EnergyLayer1.x=0;
			EnergyLayer1.y=113.9;
			EnergyLayer2.x=0;
			EnergyLayer2.y=107;
			addChild(BackImage);
			addChild(EnergyLayer1);
			addChild(MiddleImage);
			addChild(EnergyLayer2);
			addChild(FrontImage);
			HideImage=new Image(Assets.getTexture("SunVaseEnergyHide_DreamGround"));
			HideImage.x=-58.15;
			HideImage.y=-12.1;
			addChild(HideImage);
			//AddNumbers(5678);
			var sSunEnergy:uint=sunEnergy;
			sunEnergy=0;
			//Numbers=null;
			TakeEnergy(sSunEnergy);
			
			//ObjectVector[0] = image;
		}
		public function AddNumbersAt(Energy:int):void
		{
			//Numbers = new TextureAtlas(Texture.fromBitmap(new NumberSheet()), XML(new NumberSheetXML())).getTextures("SunVaseNumber");
			if(ShowNumber!=null)
			{
				removeChild(ShowNumber);
				ShowNumber.dispose();
				ShowNumber=null;
			}
			ShowNumber=new Image(Numbers[Energy/25]);
			ShowNumber.x=15.35;
			ShowNumber.y=47.4;
			addChild(ShowNumber);
			//trace("I'mHandSome!");
	    }
		public function TakeEnergy(Energy:int):void
		{
			this.unflatten();
			sunEnergy = sunEnergy+Energy;
			if(sunEnergy >= 10000)
				sunEnergy=9975;
			if(sunEnergy < 0)
				sunEnergy = 0;
			if(sunEnergy == 50 && parent.SpecialLevels == "Level1" && !parent.IfShowedTip7)
			{
				parent.Tip7();
			}
			if(sunEnergy == 100 && parent.SpecialLevels == "Level1" && !parent.IfShowedTip8)
			{
				parent.Tip8();
			}
				
			AddNumbersAt(sunEnergy);
			var sSunEnergy:uint;
			sSunEnergy = sunEnergy;
			EnergyLayer1.y -= (Energy*0.01139);
			EnergyLayer2.y = 107;
			if(sunEnergy >= 775)
			{EnergyLayer2.y -= 5;sunEnergy-=775;}
			else
			{EnergyLayer2.y -= sunEnergy*0.00645;sunEnergy=sSunEnergy;return;}
			if(sunEnergy>=2025)
			{
				EnergyLayer2.y-=19;sunEnergy-=2025;
			}
			else
			{
				EnergyLayer2.y-=sunEnergy*0.00938;
				sunEnergy=sSunEnergy;
				return;
			}
			if(sunEnergy>=1575)
			{
				EnergyLayer2.y-=10;
				sunEnergy-=1575;
			}
			else
			{
				EnergyLayer2.y-=sunEnergy*0.00634;
				sunEnergy=sSunEnergy;
				return;
			}
			if(sunEnergy>=1275)
			{
				EnergyLayer2.y-=13;
				sunEnergy-=1275;
			}
			else
			{
				EnergyLayer2.y -= sunEnergy*0.0101;
				sunEnergy=sSunEnergy;
				return;
			}
			if(sunEnergy>=1300)
			{
				EnergyLayer2.y -= 23;
				sunEnergy -= 1300;
			}
			else
			{
				EnergyLayer2.y -= sunEnergy*0.018;
				sunEnergy = sSunEnergy;
				return;
			}
			EnergyLayer2.y -= 0.012*sunEnergy;
			this.flatten();
			//SunEnergy=sSunEnergy;
			//AddNumbersAt(SunEnergy);
		}
	}
}