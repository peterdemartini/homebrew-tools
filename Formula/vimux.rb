class Vimux < Formula
  VERSION = "2.0.0"

  desc "Tmux project session with vim"
  url "https://github.com/peterdemartini/dev-tools-vimux/archive/v#{VERSION}.tar.gz"
  sha256 "9420e148163efd7c711037a7c48925fbc1c166580b68bc6b6990bda3d2635069"

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
