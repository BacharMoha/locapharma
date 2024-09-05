<?php

namespace App\Controller;

use App\Entity\Notification;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Pharmacie;
use Symfony\Component\HttpFoundation\Response;

class PharmacieProcheController extends AbstractController
{

    #[Route('/pharmacieproche', name: 'pharmacie_proche')]
    public function showMap(EntityManagerInterface $entityManager): Response
    {
        $notification = $entityManager->getRepository(Notification::class)->findAll();


        $query = $entityManager->createQuery(
            'SELECT COUNT(n.id) 
            FROM App\Entity\Notification n'
        );

        $notificationCount = $query->getSingleScalarResult();

        return $this->render('pharmacie_proche/index.html.twig', [
            
            'notification_count' => $notificationCount,
            'notifications' => $notification
        ]);
    }

    #[Route('/api/pharmacies', name: 'api_pharmacies')]
    public function getPharmacies(EntityManagerInterface $entityManager): JsonResponse
    {
        // Récupérer toutes les entités Pharmacie
        $pharmacies = $entityManager->getRepository(Pharmacie::class)->findAll();

        $data = [];
        foreach ($pharmacies as $pharmacie) {
            $data[] = [
                'nom' => $pharmacie->getNomPharma(),
                'latitude' => $pharmacie->getLatitude(),
                'longitude' => $pharmacie->getLongitude(),
            ];
        }

        return new JsonResponse($data);
    }
}
