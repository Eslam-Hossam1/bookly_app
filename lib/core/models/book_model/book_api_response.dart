import 'package:equatable/equatable.dart';

import 'book_model.dart';

class BookApiResponse extends Equatable {
  final String? kind;
  final int? totalItems;
  final List<BookModel>? books;

  const BookApiResponse({this.kind, this.totalItems, this.books});

  factory BookApiResponse.fromJson(Map<String, dynamic> json) =>
      BookApiResponse(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as int?,
        books: (json['items'] as List<dynamic>?)
            ?.map((e) => BookModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': books?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [kind, totalItems, books];
}
