#!/usr/bin/env python3
import logging
import subprocess

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__file__)


def main():
    subprocess.run(
        f"./bin/launch.sh --server-config=/opt/infinispan/server/conf/mm-infinispan.xml",
        shell=True,
        check=True,
    )


if __name__ == "__main__":
    main()
