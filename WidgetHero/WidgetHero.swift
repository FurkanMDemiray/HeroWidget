//
//  WidgetHero.swift
//  WidgetHero
//
//  Created by Melik Demiray on 29.12.2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    var savedHero : HeroModel?
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), hero: wolwerine)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        if let savedData = UserDefaults.standard.data(forKey: "hero"),
            let loadedPerson = try? JSONDecoder().decode(HeroModel.self, from: savedData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: loadedPerson)
            print(savedData)
            return SimpleEntry(date: Date(), configuration: configuration, hero: loadedPerson)
        } else {
            // Veri yoksa varsayılan bir değer döndür
            return SimpleEntry(date: Date(), configuration: configuration, hero: wolwerine)
        }
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        if let savedData = UserDefaults.standard.data(forKey: "hero"),
            let loadedPerson = try? JSONDecoder().decode(HeroModel.self, from: savedData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: loadedPerson)
            entries.append(entry)
        } else {
            // Veri yoksa varsayılan bir değerle timeline oluştur
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: batman)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let hero: HeroModel
}

struct WidgetHeroEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageSwiftUIView(image: Image(entry.hero.image))
    }
}

struct WidgetHero: Widget {
    let kind: String = "WidgetHero"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetHeroEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }

    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WidgetHero()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley, hero: wolwerine)
    SimpleEntry(date: .now, configuration: .starEyes, hero: batman)
}

