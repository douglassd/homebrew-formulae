class PassUpdate < Formula
  desc "A pass extension to open a site in the default browser"
  homepage "https://github.com/douglassd/pass-extension-open"
  url "https://github.com/douglassd/pass-extension-open/archive/v1.0.0.tar.gz"
  sha256 "5aff38c942a47736da6b8a45a37415c2c177e8d8a0d59e6a3938a85ebfe1d016"
  head "https://github.com/douglassd/pass-extension-open.git"

  depends_on "pass"

  def install
    system "make", "PREFIX=#{prefix}", "BASHCOMPDIR=#{bash_completion}", "install"
  end

  @@enable_extensions = "PASSWORD_STORE_ENABLE_EXTENSIONS=true"
  @@extensions_dir = "PASSWORD_STORE_EXTENSIONS_DIR=#{HOMEBREW_PREFIX}/lib/password-store/extensions"

  def caveats; <<~EOS
    To enable pass to find the installed extension #{name} you have to set the two environment variables

      #{@@enable_extensions}
      #{@@extensions_dir}

    once in your ~/.bash_profile or as prefixes for every call of the extension.
  EOS
  end

end
