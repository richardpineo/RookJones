

import UIKit

var levelBundles: [LevelBundle] = LevelBundleLoader().levelBundles

private class LevelBundleLoader {
	init() {
		levelBundles = [LevelBundle]()
		let levels = BoardLoader.loadLevels()
		loadTests(levels: levels)
		loadDiamonds(levels: levels)
	}

	private func loadTests(levels: [Level]) {
		let backgroundColor = UIColor(red: 0.2275, green: 0.4667, blue: 0.5412, alpha: 1.0)
		let demonstrations = LevelBundle(name: "Demonstration Levels", backgroundColor: backgroundColor)
		addLevel(levelBundle: demonstrations, levels: levels, fileName: "Test_00", shortName: "01")
		addLevel(levelBundle: demonstrations, levels: levels, fileName: "Test_01", shortName: "02")
		levelBundles.append(demonstrations)
	}

	private func loadDiamonds(levels: [Level]) {
		let backgroundColor = UIColor(red: 0.7216, green: 0.5373, blue: 0.3569, alpha: 1.0)
		let diamonds = LevelBundle(name: "Dungeon of Diamonds", backgroundColor: backgroundColor)
		addLevel(levelBundle: diamonds, levels: levels, fileName: "Diamonds_03", shortName: "03")
		addLevel(levelBundle: diamonds, levels: levels, fileName: "Diamonds_07", shortName: "07")
		addLevel(levelBundle: diamonds, levels: levels, fileName: "Diamonds_08", shortName: "08")
		addLevel(levelBundle: diamonds, levels: levels, fileName: "Diamonds_13", shortName: "13")
		addLevel(levelBundle: diamonds, levels: levels, fileName: "Diamonds_17", shortName: "17")
		levelBundles.append(diamonds)
	}

	private func addLevel(levelBundle: LevelBundle, levels: [Level], fileName: String, shortName: String) {
		let level = findLevel(levels: levels, name: fileName)
		if level != nil {
			levelBundle.levels.append(LevelUI(shortName: shortName, level: level!))
		}
	}

	private func findLevel(levels: [Level], name: String) -> Level? {
		levels.first(where: { (level) -> Bool in
			level.name == name
        })
	}

	var levelBundles: [LevelBundle]
}
