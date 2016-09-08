class Vimux < Formula
  VERSION = "2.1.0"

  desc "Tmux project session with vim"
  url "https://github.com/peterdemartini/dev-tools-vimux/archive/v#{VERSION}.tar.gz"
  sha256 "807bd0bcaa76545c5cd08c4484c02eab48670b3f7de8f06395e56dbe7fc24940"

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
