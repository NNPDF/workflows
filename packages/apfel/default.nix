{
  perSystem = {pkgs, ...}: {
    packages.apfel = pkgs.stdenv.mkDerivation (let
      version = "";

      inherit (pkgs) autoreconfHook fetchFromGitHub lib;
      inherit (lib) licenses maintainers platforms;
    in {
      pname = "apfel";
      inherit version;

      src = fetchFromGitHub {
        owner = "scarrazza";
        repo = "apfel";
        rev = "4426f689a95fbde94012083dd55a9af0edcc5928";
        hash = "sha256-GcXpveoU4bbTOtmUW5Rfp3f8MyPUIXqFFwbWp1tg8YQ=";
      };

      nativeBuildInputs = [autoreconfHook];

      buildInputs = with pkgs; [gfortran lhapdf python3 zlib];

      enableParallelBuilding = true;

      meta = {
        description = "A PDF Evolution Library";
        license = licenses.gpl3Plus;
        homepage = "https://apfel.mi.infn.it/";
        platforms = platforms.unix;
        maintainers = with maintainers; [
          {
            email = "candido.ale@gmail.com";
            github = "AleCandido";
            githubId = 10830876;
            name = "Alessandro Candido";
          }
        ];
      };
    });
  };
}
