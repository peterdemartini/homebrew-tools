class Vimux < Formula
  VERSION = "2.1.2"

  desc "Tmux project session with vim"
  url "https://github.com/peterdemartini/dev-tools-vimux/archive/v#{VERSION}.tar.gz"
  sha256 "ff007dc5efcb0c732a9cdde393e8c10cbca5826417d5b58f1e0bc87c21a5f839"

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
