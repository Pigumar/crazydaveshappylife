package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.filters.ColorMatrixFilter;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		// Bitmaps
		
		[Embed(source = "../media/textures/Dream_BackGround_BackGround.png")]
		private static const Dream_BackGround_Background:Class;
		
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Shaking.png")]
		private static const DaveZombie_ShakingFrames:Class;
		
		
		[Embed(source = "../media/textures/LevelNumber.png")]
		private static const LevelNumber:Class;
		
		[Embed(source = "../media/textures/Dream_BackGround_LevelButton.png")]
		private static const Dream_BackGround_LevelButton:Class;
		
		[Embed(source = "../media/textures/Dream_BackGround_LevelButton_Touched.png")]
		private static const Dream_BackGround_LevelButton_Pressed:Class;
		
		[Embed(source = "../media/textures/Dream_BackGround.png")]
		private static const Dream_BackGround:Class;
		
		[Embed(source = "../media/textures/SunVase/PuttingSunVase.png")]
		private static const PuttingSunVase:Class;
		
		[Embed(source = "../media/textures/ReadySetPlants_SpriteSheet.png")]
		private static const ReadySetPlants_SpriteSheet:Class;
		
		[Embed(source = "../media/textures/LockedCard.png")]
		private static const LockedCard:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cone_Shaking.png")]
		private static const DaveZombie_Cone_Shaking:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseFront.png")]
		private static const SunVaseFront:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseMiddle.png")]
		private static const SunVaseMiddle:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseBack.png")]
		private static const SunVaseBack:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseSunLightEnergy_Layer2.png")]
		private static const SunVaseSunLightEnergy_Layer2:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseSunLightEnergy_Layer1.png")]
		private static const SunVaseSunLightEnergy_Layer1:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseEnergyHide_DreamGround.png")]
		private static const SunVaseEnergyHide_DreamGround:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseNumber.png")]
		private static const SunVaseNumber:Class;
		
		[Embed(source = "../media/textures/SunLight.png")]
		private static const SunLight:Class;
		
		[Embed(source = "../media/textures/PlantCardBody.png")]
		private static const PlantCardBody:Class;
		
		[Embed(source = "../media/textures/PlantSheetNumber.png")]
		private static const PlantSheetNumber:Class;
		
		[Embed(source = "../media/textures/PlantCardSheet.png")]
		private static const PlantCardSheet:Class;
		
		[Embed(source = "../media/textures/CardUpState.png")]
		private static const CardUpState:Class;
		
		[Embed(source = "../media/textures/CardOnState.png")]
		private static const CardOnState:Class;
		
		[Embed(source = "../media/textures/CardDownState.png")]
		private static const CardDownState:Class;
		
		[Embed(source = "../media/textures/MouseChasePlant.png")]
		private static const MouseChasePlant:Class;
		
		[Embed(source = "../media/textures/PlantSheetNumberWithOutSun.png")]
		private static const PlantSheetNumberWithOutSun:Class;
		
		[Embed(source = "../media/textures/CardNoSunUpState.png")]
		private static const CardNoSunUpState:Class;
		
		[Embed(source = "../media/textures/CardNoSunOnState.png")]
		private static const CardNoSunOnState:Class;
		
		[Embed(source = "../media/textures/CardNoSunDownState.png")]
		private static const CardNoSunDownState:Class;
		
		[Embed(source = "../media/textures/ReFleshBlank1.png")]
		private static const ReFleshBlank1:Class;
		
		[Embed(source = "../media/textures/ReFleshBlank2.png")]
		private static const ReFleshBlank2:Class;
		
		[Embed(source = "../media/textures/CardReFleshingOnState.png")]
		private static const CardReFleshingOnState:Class;
		
		[Embed(source = "../media/textures/CardReFleshingDownState.png")]
		private static const CardReFleshingDownState:Class;
		
		[Embed(source = "../media/textures/MCPlantP1.png")]
		private static const MCPlantP1:Class;
		
		[Embed(source = "../media/textures/MCPlantP2.png")]
		private static const MCPlantP2:Class;
		
		[Embed(source = "../media/textures/MCPlantP3.png")]
		private static const MCPlantP3:Class;
		
		[Embed(source = "../media/textures/MCPlantP4.png")]
		private static const MCPlantP4:Class;
		
		[Embed(source = "../media/textures/ReadyImagePutPlants.png")]
		private static const ReadyImagePutPlants:Class;
		
		[Embed(source = "../media/textures/PeaCockFlower/PeaCockFlower.png")]
		private static const PeaCockFlower:Class;
		
		[Embed(source = "../media/textures/LineButtonTexture.png")]
		private static const LineButtonTexture:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_MovingWays.png")]
		private static const DaveZombie_MovingWays:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Eating.png")]
		private static const DaveZombie_Eating:Class;
		
		[Embed(source = "../media/textures/WallNut/WallNut.png")]
		private static const WallNut:Class;
		
		[Embed(source = "../media/textures/WallNut/WallNut_Charred.png")]
		private static const WallNut_Charred:Class;
		
		[Embed(source = "../media/textures/WallNut/WallNut_Charred2.png")]
		private static const WallNut_Charred2:Class;
		
		[Embed(source = "../media/textures/Devil_Fern/Devil_Fern.png")]
		private static const Devil_Fern:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cursed.png")]
		private static const DaveZombie_Cursed:Class;
		
		[Embed(source = "../media/textures/LotusSeedPodShooter/LotusSeedPodShooter.png")]
		private static const LotusSeedPodShooter:Class;
		
		[Embed(source = "../media/textures/LotusSeedPodShooter/LotusSeedPodShooter_Shoot.png")]
		private static const LotusSeedPodShooter_Shoot:Class;
		
		[Embed(source = "../media/textures/Shadow.png")]
		private static const Shadow:Class;
		
		[Embed(source = "../media/textures/Bullets/LotusSeedPodShooter_Bullet.png")]
		private static const LotusSeedPodShooter_Bullet:Class;
		
		[Embed(source = "../media/textures/Bullets/ExplodeLotusSeedPod.png")]
		private static const ExplodeLotusSeedPod:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Hand_MovingWays.png")]
		private static const DaveZombie_Hand_MovingWays:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_innerHand_MovingWays.png")]
		private static const DaveZombie_innerHand_MovingWays:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Hand_Eating.png")]
		private static const DaveZombie_Hand_Eating:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_innerHand_Eating.png")]
		private static const DaveZombie_innerHand_Eating:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_brokeHand_MovingWays.png")]
		private static const DaveZombie_brokeHand_MovingWays:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_brokeHand_Eating.png")]
		private static const DaveZombie_brokeHand_Eating:Class;
		
		[Embed(source = "../media/textures/FlagSign.png")]
		private static const FlagSign:Class;
		
		[Embed(source = "../media/textures/FinalFlagSign.png")]
		private static const FinalFlagSign:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_FlagHand_MovingWays.png")]
		private static const DaveZombie_FlagHand_MovingWays:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_FlagHand_Eating.png")]
		private static const DaveZombie_FlagHand_Eating:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cone_Charred1_Shaking.png")]
		private static const DaveZombie_Cone_Charred1_Shaking:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cone_Charred2_Shaking.png")]
		private static const DaveZombie_Cone_Charred2_Shaking:Class;
		
		[Embed(source = "../media/textures/ProgressBar.png")]
		private static const ProgressBar:Class;
		
		[Embed(source = "../media/textures/ProgressBarTop.png")]
		private static const ProgressBarTop:Class;
		
		[Embed(source = "../media/textures/ProgressBarTip.png")]
		private static const ProgressBarTip:Class;
		
		[Embed(source = "../media/textures/ProgressBarHead_Dream.png")]
		private static const ProgressBarHead_Dream:Class;
		
		[Embed(source = "../media/textures/LevelIntroduceNumber.png")]
		private static const LevelIntroduceNumber:Class;
		
		[Embed(source = "../media/textures/ProgressBarFlag_Dream.png")]
		private static const ProgressBarFlag_Dream:Class;
		
		[Embed(source = "../media/textures/PauseOnState.png")]
		private static const PauseOnState:Class;
		
		[Embed(source = "../media/textures/PauseUpState.png")]
		private static const PauseUpState:Class;
		
		[Embed(source = "../media/textures/PauseDownState.png")]
		private static const PauseDownState:Class;
		
		[Embed(source = "../media/textures/nextlevelbutton.png")]
		private static const nextlevelbutton:Class;
		
		[Embed(source = "../media/textures/SpeedOnState.png")]
		private static const SpeedOnState:Class;
		
		[Embed(source = "../media/textures/SpeedUpState.png")]
		private static const SpeedUpState:Class;
		
		[Embed(source = "../media/textures/SpeedDownState.png")]
		private static const SpeedDownState:Class;
		
		[Embed(source = "../media/textures/SlowOnState.png")]
		private static const SlowOnState:Class;
		
		[Embed(source = "../media/textures/SlowUpState.png")]
		private static const SlowUpState:Class;
		
		[Embed(source = "../media/textures/SlowDownState.png")]
		private static const SlowDownState:Class;
		
		[Embed(source = "../media/textures/BlackSquare.png")]
		private static const BlackSquare:Class;
		
		[Embed(source = "../media/textures/ZombieWonCorn.png")]
		private static const ZombieWonCorn:Class;
		
		[Embed(source = "../media/textures/Tip/Tip1.png")]
		private static const Tip1:Class;
		
		[Embed(source = "../media/textures/Tip/Tip2.png")]
		private static const Tip2:Class;
		
		[Embed(source = "../media/textures/Tip/Tip3.png")]
		private static const Tip3:Class;
		
		[Embed(source = "../media/textures/Tip/Tip4.png")]
		private static const Tip4:Class;
		
		[Embed(source = "../media/textures/Tip/Tip5.png")]
		private static const Tip5:Class;
		
		[Embed(source = "../media/textures/Tip/Tip6.png")]
		private static const Tip6:Class;
		
		[Embed(source = "../media/textures/Tip/Tip7.png")]
		private static const Tip7:Class;
		
		[Embed(source = "../media/textures/Tip/Tip8.png")]
		private static const Tip8:Class;
		
		[Embed(source = "../media/textures/Tip/Tip9.png")]
		private static const Tip9:Class;
		
		[Embed(source = "../media/textures/Tip/Tip10.png")]
		private static const Tip10:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Bucket_Shaking.png")]
		private static const DaveZombie_Bucket_Shaking:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Bucket_Charred1_Shaking.png")]
		private static const DaveZombie_Bucket_Charred1_Shaking:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Bucket_Charred2_Shaking.png")]
		private static const DaveZombie_Bucket_Charred2_Shaking:Class;
		
		[Embed(source = "../media/textures/Shovel.png")]
		private static const Shovel:Class;
		
		[Embed(source = "../media/textures/ShovelContainer.png")]
		private static const ShovelContainer:Class;
		
		[Embed(source = "../media/textures/PrizeLightTexture1.png")]
		private static const PrizeLightTexture1:Class;
		
		[Embed(source = "../media/textures/WhiteSquare.png")]
		private static const WhiteSquare:Class;
		// XML
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_ShakingXML:Class;
		
		[Embed(source = "../media/textures/LevelNumber.xml", mimeType="application/octet-stream")]
		private static const LevelNumberXML:Class;
		
		[Embed(source = "../media/textures/ReadySetPlants_SpriteSheet.xml", mimeType="application/octet-stream")]
		private static const ReadySetPlants_SpriteSheetXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cone_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Cone_ShakingXML:Class;
		
		[Embed(source = "../media/textures/SunVase/SunVaseNumber.xml", mimeType="application/octet-stream")]
		private static const SunVaseNumberXML:Class;
		
		[Embed(source = "../media/textures/SunLight.xml", mimeType="application/octet-stream")]
		private static const SunLightXML:Class;
		
		[Embed(source = "../media/textures/PlantCardSheet.xml", mimeType="application/octet-stream")]
		private static const PlantCardSheetXML:Class;
		
		[Embed(source = "../media/textures/PlantSheetNumber.xml", mimeType="application/octet-stream")]
		private static const PlantSheetNumberXML:Class;
		
		[Embed(source = "../media/textures/MouseChasePlant.xml", mimeType="application/octet-stream")]
		private static const MouseChasePlantXML:Class;
		
		[Embed(source = "../media/textures/PlantSheetNumberWithOutSun.xml", mimeType="application/octet-stream")]
		private static const PlantSheetNumberWithOutSunXML:Class;
		
		[Embed(source = "../media/textures/MCPlantP1.xml", mimeType="application/octet-stream")]
		private static const MCPlantP1XML:Class;
		
		[Embed(source = "../media/textures/MCPlantP2.xml", mimeType="application/octet-stream")]
		private static const MCPlantP2XML:Class;
		
		[Embed(source = "../media/textures/MCPlantP3.xml", mimeType="application/octet-stream")]
		private static const MCPlantP3XML:Class;
		
		[Embed(source = "../media/textures/MCPlantP4.xml", mimeType="application/octet-stream")]
		private static const MCPlantP4XML:Class;
		
		[Embed(source = "../media/textures/ReadyImagePutPlants.xml", mimeType="application/octet-stream")]
		private static const ReadyImagePutPlantsXML:Class;
		
		[Embed(source = "../media/textures/PeaCockFlower/PeaCockFlower.xml", mimeType="application/octet-stream")]
		private static const PeaCockFlowerXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_MovingWays.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_MovingWaysXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Eating.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_EatingXML:Class;
		
		[Embed(source = "../media/textures/WallNut/WallNut.xml", mimeType="application/octet-stream")]
		private static const WallNutXML:Class;
		
		[Embed(source = "../media/textures/WallNut/WallNut_Charred.xml", mimeType="application/octet-stream")]
		private static const WallNut_CharredXML:Class;
		
		[Embed(source = "../media/textures/WallNut/WallNut_Charred2.xml", mimeType="application/octet-stream")]
		private static const WallNut_Charred2XML:Class;
		
		[Embed(source = "../media/textures/Devil_Fern/Devil_Fern.xml", mimeType="application/octet-stream")]
		private static const Devil_FernXML:Class;
		
		[Embed(source = "../media/textures/LotusSeedPodShooter/LotusSeedPodShooter.xml", mimeType="application/octet-stream")]
		private static const LotusSeedPodShooterXML:Class;
		
		[Embed(source = "../media/textures/LotusSeedPodShooter/LotusSeedPodShooter_Shoot.xml", mimeType="application/octet-stream")]
		private static const LotusSeedPodShooter_ShootXML:Class;
		
		[Embed(source = "../media/textures/Bullets/ExplodeLotusSeedPod.xml", mimeType="application/octet-stream")]
		private static const ExplodeLotusSeedPodXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Hand_MovingWays.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Hand_MovingWaysXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_innerHand_MovingWays.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_innerHand_MovingWaysXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Hand_Eating.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Hand_EatingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_innerHand_Eating.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_innerHand_EatingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_brokeHand_MovingWays.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_brokeHand_MovingWaysXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_brokeHand_Eating.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_brokeHand_EatingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_FlagHand_MovingWays.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_FlagHand_MovingWaysXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_FlagHand_Eating.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_FlagHand_EatingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cone_Charred1_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Cone_Charred1_ShakingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Cone_Charred2_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Cone_Charred2_ShakingXML:Class;
		
		[Embed(source = "../media/textures/LevelIntroduceNumber.xml", mimeType="application/octet-stream")]
		private static const LevelIntroduceNumberXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Bucket_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Bucket_ShakingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Bucket_Charred1_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Bucket_Charred1_ShakingXML:Class;
		
		[Embed(source = "../media/textures/DaveZombie/DaveZombie_Bucket_Charred2_Shaking.xml", mimeType="application/octet-stream")]
		private static const DaveZombie_Bucket_Charred2_ShakingXML:Class;
		
		private static var sTextures:Dictionary = new Dictionary();
		private static var sTextureAtlas:Dictionary = new Dictionary();
		private static var scolorMatrixFilter:Dictionary = new Dictionary();
		
		public static function getColorMatrixFilter():ColorMatrixFilter
		{
			if(scolorMatrixFilter["ColorMatrixFilter"] == undefined){scolorMatrixFilter["ColorMatrixFilter"] = new ColorMatrixFilter();}
			return scolorMatrixFilter["ColorMatrixFilter"];
			
		}
		public static function getTexture(name:String):Texture
		{
			if (Assets[name] != undefined)
			{
				if (sTextures[name] == undefined)
				{
					var bitmap:Bitmap = new Assets[name]();
					sTextures[name] = Texture.fromBitmap(bitmap);
				}
				return sTextures[name];
			} 
			else 
			{
				throw new Error("Resource not defined.");
			}
		}
		
		public static function getTextures(imgName:String,xmlName:String,prefixName:String):Vector.<Texture>
		{
			if (Assets[imgName] != undefined && Assets[xmlName] != undefined)
			{
				var pairName:String=imgName + ' ' + prefixName;
				if (sTextureAtlas[pairName] == undefined)
				{
					var xml:XML = XML(new Assets[xmlName]());
					sTextureAtlas[pairName] = new TextureAtlas(getTexture(imgName), xml).getTextures(prefixName);
				}
				return sTextureAtlas[pairName];
			} 
			else 
			{
				throw new Error("Resource not defined.");
			}
		}
		
		
	}
}
/*
Plants:
1 : LotusSeedPodShooter
2 : PeacockFlower
3 : Wallnut
4 : Devil'sFern

ShowZombie:
1 : DaveZombie
2 : DaveZombie_WearCornCone

LevelMessage(A[0]):
1 : ClickedCard

NeedToChange:
other/Card/GetPlantNumber
other/Card/Refleshfps
other/Card/IfRefleshwithBegin
other/Card/SendMassage
other/Level/RIPMisX
other/Level/RIPMisY
other/Level/showZombieimage
other/Level/SendMassage
other/Level/GetCardNumberValue
button/TouchToPlant/DGP
button/TouchToPlant/MisofPutPX
button/TouchToPlant/MisofPutPY
other/Lines/GetZombie
*/