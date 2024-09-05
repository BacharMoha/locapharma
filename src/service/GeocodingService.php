<?php 

// src/Service/GeocodingService.php
namespace App\Service;

class GeocodingService
{
    public function extractCoordinatesFromUrl(string $url): ?array
    {
        // Extraction des coordonnées du marqueur
        if (preg_match('/marker=([-?\d\.]+),([-?\d\.]+)/', $url, $matches)) {
            return [
                'latitude' => (float) $matches[1],
                'longitude' => (float) $matches[2],
            ];
        }

        return null;
    }

    public function calculateDistance(float $lat1, float $lon1, float $lat2, float $lon2): float
    {
        $earthRadius = 6371; // Rayon de la Terre en kilomètres

        // Convertir les degrés en radians
        $lat1Rad = deg2rad($lat1);
        $lon1Rad = deg2rad($lon1);
        $lat2Rad = deg2rad($lat2);
        $lon2Rad = deg2rad($lon2);

        // Calcul de la différence entre les coordonnées
        $latDiff = $lat2Rad - $lat1Rad;
        $lonDiff = $lon2Rad - $lon1Rad;

        // Calcul de la distance
        $a = sin($latDiff / 2) ** 2 +
            cos($lat1Rad) * cos($lat2Rad) *
            sin($lonDiff / 2) ** 2;
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        // Distance en kilomètres
        return $earthRadius * $c;
    }
}
