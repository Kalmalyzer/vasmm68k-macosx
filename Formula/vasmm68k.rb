class Vasmm68k < Formula
    desc "Cross-assembler for 680x0 processors / Amiga OS"
    homepage "http://sun.hasenbraten.de/vasm"
    url "http://server.owl.de/~frank/tags/vasm1_8f.tar.gz"
    sha256 "9a97952951912b070a1b9118a466a3cd8024775be45266ede3f78b2f99ecc1f2"
  
    # depends_on "cmake" => :build
  
    def install
      # ENV.deparallelize
    #   system "./configure", "--disable-debug",
    #                         "--disable-dependency-tracking",
    #                         "--disable-silent-rules",
    #                         "--prefix=#{prefix}"
      # system "cmake", ".", *std_cmake_args
      #system "make", "install"
      system "(make CPU=m68k SYNTAX=mot && chmod ugo+rx vasmm68k_mot)"
      system "(make CPU=m68k SYNTAX=std && chmod ugo+rx vasmm68k_std)"
      bin.install "vasmm68k_mot"
      bin.install "vasmm68k_std"
    end
  
    test do
        assert_match version.to_s, shell_output("#{bin}/vasmm68k_mot")
        assert_match version.to_s, shell_output("#{bin}/vasmm68k_std")
    end
  end
