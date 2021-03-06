#!/usr/bin/env fish
# --8<-- [This file is automatically generated from /home/eddie/.nix-profile/etc/profile.d/nix-daemon.sh, do not edit] ---
# Only execute this file once per shell.
if test -n "$__ETC_PROFILE_NIX_SOURCED" ; exit 0; end
set -g  __ETC_PROFILE_NIX_SOURCED 1

# Set up secure multi-user builds: non-root users build through the
# Nix daemon.
if test "$USER" != root -o ! -w /nix/var/nix/db ;
    set -xg NIX_REMOTE daemon
end

set -xg NIX_USER_PROFILE_DIR /nix/var/nix/profiles/per-user/$USER
set -xg NIX_PROFILES /nix/var/nix/profiles/default $HOME/.nix-profile

# Set up the per-user profile.
mkdir -m 0755 -p $NIX_USER_PROFILE_DIR
test -O "$NIX_USER_PROFILE_DIR";
if test ! $status -eq 0;
    echo "WARNING: bad ownership on $NIX_USER_PROFILE_DIR" >&2
end

if test -w $HOME;
  test -L $HOME/.nix-profile;
  if test ! $status -eq 0;
      if test "$USER" != root;
          ln -s $NIX_USER_PROFILE_DIR/profile $HOME/.nix-profile
      else
          # Root installs in the system-wide profile by default.
          ln -s /nix/var/nix/profiles/default $HOME/.nix-profile
      end
  end

  # Subscribe the root user to the NixOS channel by default.
  if test "$USER" = root -a ! -e $HOME/.nix-channels ;
      echo "https://nixos.org/channels/nixpkgs-unstable nixpkgs" > $HOME/.nix-channels
  end

  # Create the per-user garbage collector roots directory.
  set -g  NIX_USER_GCROOTS_DIR /nix/var/nix/gcroots/per-user/$USER
  mkdir -m 0755 -p $NIX_USER_GCROOTS_DIR
  test -O "$NIX_USER_GCROOTS_DIR";
  if test ! $status -eq 0;
      echo "WARNING: bad ownership on $NIX_USER_GCROOTS_DIR" >&2
  end

  # Set up a default Nix expression from which to install stuff.
  if test ! -e $HOME/.nix-defexpr -o -L $HOME/.nix-defexpr ;
      rm -f $HOME/.nix-defexpr
      mkdir -p $HOME/.nix-defexpr
      if test "$USER" != root ;
          ln -s /nix/var/nix/profiles/per-user/root/channels $HOME/.nix-defexpr/channels_root
      end
  end
end


# Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
if test ! -z "$NIX_SSL_CERT_FILE" ;
    : # Allow users to override the NIX_SSL_CERT_FILE
else if test -e /etc/ssl/certs/ca-certificates.crt ; # NixOS, Ubuntu, Debian, Gentoo, Arch
    set -xg NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
else if test -e /etc/ssl/ca-bundle.pem ; # openSUSE Tumbleweed
    set -xg NIX_SSL_CERT_FILE /etc/ssl/ca-bundle.pem
else if test -e /etc/ssl/certs/ca-bundle.crt ; # Old NixOS
    set -xg NIX_SSL_CERT_FILE /etc/ssl/certs/ca-bundle.crt
else if test -e /etc/pki/tls/certs/ca-bundle.crt ; # Fedora, CentOS
    set -xg NIX_SSL_CERT_FILE /etc/pki/tls/certs/ca-bundle.crt
else
  # Fall back to what is in the nix profiles, favouring whatever is defined last.
  for i in $NIX_PROFILES; do
    if test -e $i/etc/ssl/certs/ca-bundle.crt ;
      set -xg NIX_SSL_CERT_FILE $i/etc/ssl/certs/ca-bundle.crt
    end
  done
end

set -xg NIX_PATH nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixpkgs /nix/var/nix/profiles/per-user/root/channels
set -xg PATH $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH

# --8<-- EOF --- vim: readonly