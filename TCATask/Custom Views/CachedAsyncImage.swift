//
//  CachedAsyncImage.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import Foundation
import SwiftUI

/// CachedAsyncImage is wrapper on AsyncImage from SwiftUI, but it's more efficient since it uses a caching mechanisem for more efficient usage.
struct CachedAsyncImage<Content>: View where Content: View{
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content

    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ){
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        if let url, let cached = ImageCache[url]{
            content(.success(cached))
        } else if let url {
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ){phase in
                cacheAndRender(phase: phase)
            }
        }
    }

    func cacheAndRender(phase: AsyncImagePhase) -> some View{
        if let url, case .success (let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

fileprivate class ImageCache{
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image?{
        get{
            ImageCache.cache[url]
        }
        set{
            ImageCache.cache[url] = newValue
        }
    }
}
