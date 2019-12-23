class Vasmm68k < Formula
    desc "Cross-assembler for 680x0 processors / Amiga OS"
    homepage "http://sun.hasenbraten.de/vasm"
    url "http://server.owl.de/~frank/tags/vasm1_8f.tar.gz"
#    sha256 "85cc828a96735bdafcf29eb6291ca91bac846579bcef7308536e0c875d6c81d7"
  
    # depends_on "cmake" => :build
  
    def install
      # ENV.deparallelize
    #   system "./configure", "--disable-debug",
    #                         "--disable-dependency-tracking",
    #                         "--disable-silent-rules",
    #                         "--prefix=#{prefix}"
      # system "cmake", ".", *std_cmake_args
      #system "make", "install"
      system "(cd vasm && make CPU=m68k SYNTAX=mot && chmod ugo+rx vasmm68k_mot)"
      system "(cd vasm && make CPU=m68k SYNTAX=std && chmod ugo+rx vasmm68k_std)"
      bin.install "vasm/vasmm68k_mot"
      bin.install "vasm/vasmm68k_std"
    end
  
    test do
        assert_match version.to_s, shell_output("#{bin}/vasmm68k_mot")
        assert_match version.to_s, shell_output("#{bin}/vasmm68k_std")
    end
  end
