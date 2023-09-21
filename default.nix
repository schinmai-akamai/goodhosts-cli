{ lib, buildGoModule, fetchFromGitHub, testers }:

buildGoModule rec {
  pname = "goodhosts";
  version = "v1.1.0";
  name = "goodhosts-${version}";

  src = fetchFromGitHub {
    owner = "goodhosts";
    repo = "cli";
    rev = version;
    sha256 = "sha256-BsStTOuMercplx+g+egjiBjCKf5UFCDLGqGVo6i5yKQ=";
  };

  ldflags = [
    "-s -w -X main.version=${version}"
  ];

  postInstall = ''
    mv $out/bin/cli $out/bin/goodhosts
  '';


  vendorHash = null;

  meta = with lib; {
    description = "Goodhosts CLI";
    license = licenses.mit;
    homepage = "https://github.com/goodhosts/cli/tree/main";
  };
}
