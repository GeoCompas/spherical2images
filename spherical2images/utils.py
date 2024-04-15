from smart_open import open
import mercantile
import requests
import os
import json
from vt2geojson.tools import vt_bytes_to_geojson
from geojson import FeatureCollection
from shapely.geometry import shape, Point
from tqdm import tqdm
from joblib import Parallel, delayed
from itertools import chain
import random
import boto3
access_token = os.environ.get("MAPILLARY_ACCESS_TOKEN")

def read_geojson(input_file):
    """Read a geojson file and return a list of features

    Args:
        input_file (str): Location on geojson file

    Returns:
        list: list fo features
    """
    fc = []
    with open(input_file, "r", encoding="utf8") as f:
        cf = json.load(f)["features"]
    return cf


def write_geojson(output_file, list_features):
    """Write geojson files

    Args:
        output_file (str): Location of ouput file
        list_features (list): List of features
    """
    with open(output_file, "w") as f:
        json.dump(FeatureCollection(list_features), f)

def exists_file(bucket_name, s3_key):
    s3_client = boto3.client("s3")

    try:
        s3_client.head_object(Bucket=bucket_name, Key=s3_key)
        return True
    except Exception:
        return False
