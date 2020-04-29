class Cgoban < Formula
  desc "Go-related services"
  homepage "https://cgoban1.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/cgoban1/cgoban1/1.9.14/cgoban-1.9.14.tar.gz"
  sha256 "3b8a6fc0e989bf977fcd9a65a367aa18e34c6e25800e78dd8f0063fa549c9b62"

  bottle do
    cellar :any_skip_relocation
    sha256 "95ba2672c251a7bb23614aee4711c84ceca8453679549847083fb5e025645f04" => :catalina
    sha256 "9784461d9756059fa03d3239c3497ee3087fcaa67bcf235bdec2bab543560fae" => :mojave
    sha256 "14efcd85d7d9f5a15fe0693eb8ebd4b1ee8b49fb7604681be91c14964af0cee3" => :high_sierra
    sha256 "4f88f760ce464806c607e9a29da5f701cc6d395f27110cd866579fdf8737931a" => :sierra
    sha256 "f6f9b32dddefb3474dca91d55c0aecdacec7e3b7ccbb2cb8c9b151b41e16f4d0" => :el_capitan
    sha256 "65b5a814e1b4e3c115c1fb873d8a740ee4c0b39eff33331336d9bfac073e1a27" => :yosemite
  end

  depends_on :x11

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--with-x"
    system "make", "install"
  end

  test do
    assert_match "version #{version}", shell_output("#{bin}/cgoban --version")
  end
end
