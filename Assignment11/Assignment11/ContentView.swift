//
//  ContentView.swift
//  Assignment11
//
//  Assignment 11
//  Aimee Jin
//  11/1/26
//

import SwiftUI

struct SpringView: View {
    var body: some View {
        VStack {
            Text("Spring Festival")
                .font(.title)
                .bold()
            Image("springfestival")
                .resizable()
                .scaledToFit()
            Text("Spring Festival, also called Chinese New Year, is the most important holiday in Chinese culture. It falls on the first day of the Lunisolar calendar, usually in late January or February. Families travel home for a reunion dinner on New Year’s Eve, hang red lanterns and couplets, set off fireworks, and give red envelopes filled with money for good luck.")
            Spacer()
        }
        .padding(16)
    }
}

struct QingmingView: View {
    var body: some View {
        VStack {
            Text("Qaingming Festival")
                .font(.title)
                .bold()
            Image("qingmingfestival")
                .resizable()
                .scaledToFit()
            Text("Qingming, or Tomb-Sweeping Day, falls in early April, a time of soft spring rain. Families visit their ancestors’ graves to sweep the tombs, offer food and flowers, and burn incense to honor those who came before them. A famous Tang dynasty poem links the day with drizzling rain and quiet remembrance, but it is also a time to enjoy spring with countryside outings and kite flying.")
            Spacer()
        }
        .padding(16)
    }
}

struct DuanwuView: View {
    var body: some View {
        VStack {
            Text("Duanwu Festival")
                .font(.title)
                .bold()
            Image("duanwufestival")
                .resizable()
                .scaledToFit()
            Text("Duanwu, also known as the Dragon Boat Festival, falls on the fifth day of the fifth Lunisolar month, usually in June. It honors Qu Yuan, a poet and loyal official from ancient China. People celebrate with dragon boat races and eat zongzi, sticky rice wrapped in bamboo leaves.")
            Spacer()
        }
        .padding(16)
    }
}


struct ContentView: View {
    var body: some View {
        TabView {
            SpringView().tabItem {
                Image("lantern")
                Text("Spring Festival")}
            QingmingView().tabItem {
                Image("springrain")
                Text("Qingming Festival")}
            DuanwuView().tabItem {
                Image("zongzi")
                Text("Duanwu Festival")}
        }
    }
}

#Preview {
    ContentView()
}
