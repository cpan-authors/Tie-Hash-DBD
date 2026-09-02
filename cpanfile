requires   "Carp";
requires   "DBI"                      => "1.613";
requires   "Storable";

recommends "DBD::CSV"                 => "0.64";
recommends "DBD::Pg"                  => "3.21.2";
recommends "DBD::SQLite"              => "1.78";
recommends "DBI"                      => "1.652";
recommends "Sereal"                   => "5.010";
recommends "Storable"                 => "3.41";

on "configure" => sub {
    requires   "ExtUtils::MakeMaker";

    recommends "ExtUtils::MakeMaker"      => "7.22";

    suggests   "ExtUtils::MakeMaker"      => "7.78";
    };

on "test" => sub {
    requires   "Test::Harness";
    requires   "Test::More"               => "0.90";
    requires   "Time::HiRes";

    recommends "Test::More"               => "1.302224";
    };
