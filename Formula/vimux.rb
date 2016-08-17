class Vimux < Formula
  VERSION = "1.0.0"

  desc "Tmux project session with vim"
  url "https://github.com/peterdemartini/dev-tools-vimux/archive/v#{VERSION}.tar.gz"
  sha256 "964f69c8e0a195dff6f8e529bc4b00fce96b18d2362ff3ff34522c6c9558876e"

  depends_on "tmux"

  def install
    inreplace "vimux.sh", 'local directory="$(script_directory)"', ""
    inreplace "vimux.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "vimux.sh", "vimux"

    bin.install "vimux"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/vimux --version").strip
  end
end
