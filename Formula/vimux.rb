class Vimux < Formula
  VERSION = "2.1.1"

  desc "Tmux project session with vim"
  url "https://github.com/peterdemartini/dev-tools-vimux/archive/v#{VERSION}.tar.gz"
  sha256 "7d1dc3fcebc2906b561c72e42229f6c5d3e04d46c48aa06e8c36a31d3437d185"

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
