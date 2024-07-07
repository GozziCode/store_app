// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    final int? page;
    final int? size;
    final int? total;
    final dynamic debug;
    final dynamic previousPage;
    final dynamic nextPage;
    final List<Item>? items;

    ProductModel({
        this.page,
        this.size,
        this.total,
        this.debug,
        this.previousPage,
        this.nextPage,
        this.items,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        page: json["page"],
        size: json["size"],
        total: json["total"],
        debug: json["debug"],
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "total": total,
        "debug": debug,
        "previous_page": previousPage,
        "next_page": nextPage,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    final String? name;
    final String? description;
    final String? uniqueId;
    final String? urlSlug;
    final bool? isAvailable;
    final bool? isService;
    final dynamic previousUrlSlugs;
    final bool? unavailable;
    final dynamic unavailableStart;
    final dynamic unavailableEnd;
    final String? id;
    final dynamic parentProductId;
    final dynamic parent;
    final String? organizationId;
    final dynamic stockId;
    final List<dynamic>? productImage;
    final List<dynamic>? categories;
    final DateTime? dateCreated;
    final DateTime? lastUpdated;
    final String? userId;
    final List<Photo>? photos;
    final dynamic prices;
    final dynamic stocks;
    final List<CurrentPrice>? currentPrice;
    final bool? isDeleted;
    final dynamic availableQuantity;
    final dynamic sellingPrice;
    final dynamic discountedPrice;
    final dynamic buyingPrice;
    final dynamic extraInfos;
    final dynamic featuredReviews;
    final List<dynamic>? unavailability;

    Item({
        this.name,
        this.description,
        this.uniqueId,
        this.urlSlug,
        this.isAvailable,
        this.isService,
        this.previousUrlSlugs,
        this.unavailable,
        this.unavailableStart,
        this.unavailableEnd,
        this.id,
        this.parentProductId,
        this.parent,
        this.organizationId,
        this.stockId,
        this.productImage,
        this.categories,
        this.dateCreated,
        this.lastUpdated,
        this.userId,
        this.photos,
        this.prices,
        this.stocks,
        this.currentPrice,
        this.isDeleted,
        this.availableQuantity,
        this.sellingPrice,
        this.discountedPrice,
        this.buyingPrice,
        this.extraInfos,
        this.featuredReviews,
        this.unavailability,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        description: json["description"],
        uniqueId: json["unique_id"],
        urlSlug: json["url_slug"],
        isAvailable: json["is_available"],
        isService: json["is_service"],
        previousUrlSlugs: json["previous_url_slugs"],
        unavailable: json["unavailable"],
        unavailableStart: json["unavailable_start"],
        unavailableEnd: json["unavailable_end"],
        id: json["id"],
        parentProductId: json["parent_product_id"],
        parent: json["parent"],
        organizationId: json["organization_id"],
        stockId: json["stock_id"],
        productImage: json["product_image"] == null ? [] : List<dynamic>.from(json["product_image"]!.map((x) => x)),
        categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
        userId: json["user_id"],
        photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        prices: json["prices"],
        stocks: json["stocks"],
        currentPrice: json["current_price"] == null ? [] : List<CurrentPrice>.from(json["current_price"]!.map((x) => CurrentPrice.fromJson(x))),
        isDeleted: json["is_deleted"],
        availableQuantity: json["available_quantity"],
        sellingPrice: json["selling_price"],
        discountedPrice: json["discounted_price"],
        buyingPrice: json["buying_price"],
        extraInfos: json["extra_infos"],
        featuredReviews: json["featured_reviews"],
        unavailability: json["unavailability"] == null ? [] : List<dynamic>.from(json["unavailability"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "unique_id": uniqueId,
        "url_slug": urlSlug,
        "is_available": isAvailable,
        "is_service": isService,
        "previous_url_slugs": previousUrlSlugs,
        "unavailable": unavailable,
        "unavailable_start": unavailableStart,
        "unavailable_end": unavailableEnd,
        "id": id,
        "parent_product_id": parentProductId,
        "parent": parent,
        "organization_id": organizationId,
        "stock_id": stockId,
        "product_image": productImage == null ? [] : List<dynamic>.from(productImage!.map((x) => x)),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "date_created": dateCreated?.toIso8601String(),
        "last_updated": lastUpdated?.toIso8601String(),
        "user_id": userId,
        "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "prices": prices,
        "stocks": stocks,
        "current_price": currentPrice == null ? [] : List<dynamic>.from(currentPrice!.map((x) => x.toJson())),
        "is_deleted": isDeleted,
        "available_quantity": availableQuantity,
        "selling_price": sellingPrice,
        "discounted_price": discountedPrice,
        "buying_price": buyingPrice,
        "extra_infos": extraInfos,
        "featured_reviews": featuredReviews,
        "unavailability": unavailability == null ? [] : List<dynamic>.from(unavailability!.map((x) => x)),
    };
}

class CurrentPrice {
    final List<dynamic>? ngn;
    CurrentPrice({
        this.ngn,
    });

    factory CurrentPrice.fromJson(Map<String, dynamic> json) => CurrentPrice(
        ngn: json["NGN"] == null ? [] : List<dynamic>.from(json["NGN"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "NGN": ngn == null ? [] : List<dynamic>.from(ngn!.map((x) => x)),
    };
}

class Photo {
    final String? modelName;
    final String? modelId;
    final String? organizationId;
    final String? filename;
    final String? url;
    final bool? isFeatured;
    final bool? saveAsJpg;
    final bool? isPublic;
    final bool? fileRename;
    final int? position;

    Photo({
        this.modelName,
        this.modelId,
        this.organizationId,
        this.filename,
        this.url,
        this.isFeatured,
        this.saveAsJpg,
        this.isPublic,
        this.fileRename,
        this.position,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        modelName: json["model_name"],
        modelId: json["model_id"],
        organizationId: json["organization_id"],
        filename: json["filename"],
        url: json["url"],
        isFeatured: json["is_featured"],
        saveAsJpg: json["save_as_jpg"],
        isPublic: json["is_public"],
        fileRename: json["file_rename"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "model_name": modelName,
        "model_id": modelId,
        "organization_id": organizationId,
        "filename": filename,
        "url": url,
        "is_featured": isFeatured,
        "save_as_jpg": saveAsJpg,
        "is_public": isPublic,
        "file_rename": fileRename,
        "position": position,
    };
}
