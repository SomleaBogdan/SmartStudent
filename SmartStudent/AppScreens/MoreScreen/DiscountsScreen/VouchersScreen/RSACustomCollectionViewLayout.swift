//
//  RSACustomCollectionViewLayout.swift
//  ReeaSportsApp
//
//  Created by Somlea Felix-Bogdan on 9/13/17.
//  Copyright © 2017 REEA. All rights reserved.
//

import UIKit

public protocol CascadeLayoutDelegate {

    func collectionView(_ collectionView:UICollectionView,
                        heightForItemAtIndexPath indexPath:IndexPath) -> CGFloat
}

public class CascadeLayoutAttributes: UICollectionViewLayoutAttributes {

    var columnIndex:Int = 0

}

class RSACustomCollectionViewLayout: UICollectionViewLayout {

    public var delegate: CascadeLayoutDelegate!

    public var columns:Int = 2 {
        didSet {
            if columns != oldValue {
                invalidateLayout()
            }
        }
    }

    public var horizontalCellSpacing:CGFloat = 1
    public var verticalCellSpacing:CGFloat = 1


    public var headerHeight:CGFloat = 0
    public var footerHeight:CGFloat = 0

    private var cache = [CascadeLayoutAttributes]()
    private var contentHeight:CGFloat = 0
    private var width:CGFloat {
        get {
            return collectionView!.bounds.width
        }
    }

    public var cellContentWidth:CGFloat {
        return (width - (horizontalCellSpacing * CGFloat(columns + 1)))/CGFloat(columns)
    }

    override public var collectionViewContentSize: CGSize {
        return CGSize(width: width, height: contentHeight)
    }

    override public func prepare() {
        if !cache.isEmpty {
            return
        }

        var columnHeights: [CGFloat] = [CGFloat](repeatElement(headerHeight, count: columns))
        let headerAttribute = CascadeLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                                      with: IndexPath(index: 0))
        headerAttribute.frame = CGRect(x: 0, y: 0, width: width, height: headerHeight)
        cache.append(headerAttribute)

        let numberOfItems = collectionView?.numberOfItems(inSection: 0) ?? 0

        for item in 0..<numberOfItems {

            let indexPath:IndexPath = IndexPath(item: item, section: 0)
            let deltaY:CGFloat = 5.0
            let columnIndex:Int = columnHeights
                .enumerated()
                .sorted {
                    $0.element < ($1.element - deltaY)
                }.first?.offset ?? 0

            let height:CGFloat = self.delegate.collectionView(collectionView!,
                                                              heightForItemAtIndexPath: indexPath)

            let x =  CGFloat(columnIndex + 1) * horizontalCellSpacing + (cellContentWidth * CGFloat(columnIndex))
            let itemRect = CGRect(x:x,
                                  y: columnHeights[columnIndex] + verticalCellSpacing,
                                  width: cellContentWidth,
                                  height: height)

            let attributes = CascadeLayoutAttributes(forCellWith: indexPath)
            attributes.frame = itemRect
            cache.append(attributes)

            // append the item.height to the currenct colHeight
            columnHeights[columnIndex] = columnHeights[columnIndex] + height + verticalCellSpacing

            // make the contentHeight equal to which ever has the max colHeight
            contentHeight = (columnHeights
                .enumerated()
                .sorted {
                    $0.element > $1.element
                }.first?.element ?? 0) + verticalCellSpacing
        }
    }

    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.row]
    }

    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }

    override public func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == UICollectionElementKindSectionHeader {
            let attribute = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
            attribute.frame = CGRect(x: 0, y: 0, width: (collectionView?.frame.width)!, height: headerHeight)
            return attribute
        } else if elementKind == UICollectionElementKindSectionFooter {
            let attribute = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
            attribute.frame = CGRect(x: 0, y: 0, width: (collectionView?.frame.width)!, height: footerHeight)
            return attribute
        }
        return UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
    }

    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return newBounds.size != collectionView?.bounds.size
    }

    public override func invalidateLayout() {
        cache.removeAll()
        super.invalidateLayout()
    }

}

extension RSACustomCollectionViewLayout:Configurable {}

public protocol Configurable {}

public extension Configurable {
    @discardableResult public func configure( block: ((inout Self)) -> Void) -> Self {
        var m = self
        block(&m)
        return m
    }
}

