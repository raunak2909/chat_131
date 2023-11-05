// ignore_for_file: non_constant_identifier_names, camel_case_types

class Image {
  Original original;
  Downsized downsized;
  Downsized_large downsized_large;
  Downsized_medium downsized_medium;
  Downsized_small downsized_small;
  Downsized_still downsized_still;
  Fixed_height fixed_height;
  Fixed_height_downsampled fixed_height_downsampled;
  Fixed_width_small fixed_width_small;
  Fixed_height_small_still fixed_height_small_still;
  Fixed_width_still fixed_width_still;
  Looping looping;
  Original_still original_still;
  Original_mp4 original_mp4;
  Preview preview;
  Preview_gif preview_gif;
  Preview_webp preview_webp;
  Hd hd;
  W_still w_still;
  Four_k four_k;

  Image({
    required this.downsized,
    required this.downsized_large,
    required this.downsized_medium,
    required this.downsized_small,
    required this.downsized_still,
    required this.fixed_height,
    required this.fixed_height_downsampled,
    required this.fixed_height_small_still,
    required this.fixed_width_small,
    required this.fixed_width_still,
    required this.four_k,
    required this.hd,
    required this.looping,
    required this.original,
    required this.original_mp4,
    required this.original_still,
    required this.preview,
    required this.preview_gif,
    required this.preview_webp,
    required this.w_still,
  });
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      downsized: Downsized.fromJson(json['downsized']),
      downsized_large: Downsized_large.fromJson(json['downsized_large']),
      downsized_medium: Downsized_medium.fromJson(json['downsized_medium']),
      downsized_small: Downsized_small.fromJson(json['downsized_small']),
      downsized_still: Downsized_still.fromJson(json['downsized_still']),
      fixed_height: Fixed_height.fromJson(json['fixed_height']),
      fixed_height_downsampled:
          Fixed_height_downsampled.fromJson(json['fixed_height_downsampled']),
      fixed_height_small_still:
          Fixed_height_small_still.fromJson(json['fixed_height_small_still']),
      fixed_width_small: Fixed_width_small.fromJson(json['fixed_width_small']),
      fixed_width_still: Fixed_width_still.fromJson(json['fixed_width_still']),
      four_k: Four_k.fromJson(json['4k']),
      hd: Hd.fromJson(json['hd']),
      looping: Looping.fromJson(json['looping']),
      original: Original.fromJson(json['original']),
      original_mp4: Original_mp4.fromJson(json['original_mp4']),
      original_still: Original_still.fromJson(json['original_still']),
      preview: Preview.fromJson(json['preview']),
      preview_gif: Preview_gif.fromJson(json['preview_gif']),
      preview_webp: Preview_webp.fromJson(json['preview_webp']),
      w_still: W_still.fromJson(json['480w_still']),
    );
  }
}

class Original {
  String height;
  String width;
  String size;
  String url;
  String mp4_size;
  String mp4;
  String webp_size;
  String webp;
  String frames;
  String hash;
  Original({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4_size,
    required this.mp4,
    required this.webp_size,
    required this.webp,
    required this.frames,
    required this.hash,
  });
  factory Original.fromJson(Map<String, dynamic> json) {
    return Original(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
      webp_size: json['webp_size'],
      webp: json['webp'],
      frames: json['frames'],
      hash: json['hash'],
    );
  }
}

class Downsized {
  String height;
  String width;
  String size;
  String url;
  Downsized({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Downsized.fromJson(Map<String, dynamic> json) {
    return Downsized(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Downsized_large {
  String height;
  String width;
  String size;
  String url;
  Downsized_large({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Downsized_large.fromJson(Map<String, dynamic> json) {
    return Downsized_large(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Downsized_medium {
  String height;
  String width;
  String size;
  String url;
  Downsized_medium({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Downsized_medium.fromJson(Map<String, dynamic> json) {
    return Downsized_medium(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Downsized_small {
  String height;
  String width;
  String size;
  String url;
  Downsized_small({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Downsized_small.fromJson(Map<String, dynamic> json) {
    return Downsized_small(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Downsized_still {
  String height;
  String width;
  String size;
  String url;
  Downsized_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Downsized_still.fromJson(Map<String, dynamic> json) {
    return Downsized_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

// Height
class Fixed_height {
  String height;
  String width;
  String size;
  String url;
  String mp4_size;
  String mp4;
  String webp_size;
  String webp;
  Fixed_height({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4_size,
    required this.mp4,
    required this.webp_size,
    required this.webp,
  });
  factory Fixed_height.fromJson(Map<String, dynamic> json) {
    return Fixed_height(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
      webp_size: json['webp_size'],
      webp: json['webp'],
    );
  }
}

class Fixed_height_downsampled {
  String height;
  String width;
  String size;
  String url;
  String webp_size;
  String webp;
  Fixed_height_downsampled({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.webp_size,
    required this.webp,
  });
  factory Fixed_height_downsampled.fromJson(Map<String, dynamic> json) {
    return Fixed_height_downsampled(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      webp_size: json['webp_size'],
      webp: json['webp'],
    );
  }
}

class Fixed_height_small {
  String height;
  String width;
  String size;
  String url;
  String mp4_size;
  String mp4;
  String webp_size;
  String webp;
  Fixed_height_small({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4_size,
    required this.mp4,
    required this.webp_size,
    required this.webp,
  });
  factory Fixed_height_small.fromJson(Map<String, dynamic> json) {
    return Fixed_height_small(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
      webp_size: json['webp_size'],
      webp: json['webp'],
    );
  }
}

class Fixed_height_small_still {
  String height;
  String width;
  String size;
  String url;
  Fixed_height_small_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Fixed_height_small_still.fromJson(Map<String, dynamic> json) {
    return Fixed_height_small_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Fixed_height_still {
  String height;
  String width;
  String size;
  String url;
  Fixed_height_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Fixed_height_still.fromJson(Map<String, dynamic> json) {
    return Fixed_height_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

// Width
class Fixed_width {
  String height;
  String width;
  String size;
  String url;
  String mp4_size;
  String mp4;
  String webp_size;
  String webp;
  Fixed_width({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4_size,
    required this.mp4,
    required this.webp_size,
    required this.webp,
  });
  factory Fixed_width.fromJson(Map<String, dynamic> json) {
    return Fixed_width(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
      webp_size: json['webp_size'],
      webp: json['webp'],
    );
  }
}

class Fixed_width_downsampled {
  String height;
  String width;
  String size;
  String url;
  String webp_size;
  String webp;
  Fixed_width_downsampled({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.webp_size,
    required this.webp,
  });
  factory Fixed_width_downsampled.fromJson(Map<String, dynamic> json) {
    return Fixed_width_downsampled(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      webp_size: json['webp_size'],
      webp: json['webp'],
    );
  }
}

class Fixed_width_small {
  String height;
  String width;
  String size;
  String url;
  String mp4_size;
  String mp4;
  String webp_size;
  String webp;
  Fixed_width_small({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4_size,
    required this.mp4,
    required this.webp_size,
    required this.webp,
  });
  factory Fixed_width_small.fromJson(Map<String, dynamic> json) {
    return Fixed_width_small(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
      webp_size: json['webp_size'],
      webp: json['webp'],
    );
  }
}

class Fixed_width_small_still {
  String height;
  String width;
  String size;
  String url;
  Fixed_width_small_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Fixed_width_small_still.fromJson(Map<String, dynamic> json) {
    return Fixed_width_small_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Fixed_width_still {
  String height;
  String width;
  String size;
  String url;
  Fixed_width_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Fixed_width_still.fromJson(Map<String, dynamic> json) {
    return Fixed_width_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Looping {
  String mp4_size;
  String mp4;
  Looping({required this.mp4_size, required this.mp4});
  factory Looping.fromJson(Map<String, dynamic> json) {
    return Looping(
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
    );
  }
}

class Original_still {
  String height;
  String width;
  String size;
  String url;
  Original_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Original_still.fromJson(Map<String, dynamic> json) {
    return Original_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Original_mp4 {
  String height;
  String width;
  String mp4_size;
  String mp4;

  Original_mp4({
    required this.height,
    required this.width,
    required this.mp4_size,
    required this.mp4,
  });

  factory Original_mp4.fromJson(Map<String, dynamic> json) {
    return Original_mp4(
      height: json['height'],
      width: json['width'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
    );
  }
}

class Preview {
  String height;
  String width;
  String mp4_size;
  String mp4;

  Preview({
    required this.height,
    required this.width,
    required this.mp4_size,
    required this.mp4,
  });

  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(
      height: json['height'],
      width: json['width'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
    );
  }
}

class Preview_gif {
  String height;
  String width;
  String size;
  String url;
  Preview_gif({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Preview_gif.fromJson(Map<String, dynamic> json) {
    return Preview_gif(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Preview_webp {
  String height;
  String width;
  String size;
  String url;
  Preview_webp({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory Preview_webp.fromJson(Map<String, dynamic> json) {
    return Preview_webp(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Hd {
  String height;
  String width;
  String mp4_size;
  String mp4;

  Hd({
    required this.height,
    required this.width,
    required this.mp4_size,
    required this.mp4,
  });

  factory Hd.fromJson(Map<String, dynamic> json) {
    return Hd(
      height: json['height'],
      width: json['width'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
    );
  }
}

class W_still {
  String height;
  String width;
  String size;
  String url;
  W_still({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });
  factory W_still.fromJson(Map<String, dynamic> json) {
    return W_still(
      height: json['height'],
      width: json['width'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Four_k {
  String height;
  String width;
  String mp4_size;
  String mp4;

  Four_k({
    required this.height,
    required this.width,
    required this.mp4_size,
    required this.mp4,
  });

  factory Four_k.fromJson(Map<String, dynamic> json) {
    return Four_k(
      height: json['height'],
      width: json['width'],
      mp4_size: json['mp4_size'],
      mp4: json['mp4'],
    );
  }
}
