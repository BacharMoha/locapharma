<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class VoirOrdonnanceController extends AbstractController
{
    #[Route('/voir/ordonnance', name: 'app_voir_ordonnance')]
    public function index(): Response
    {
        return $this->render('voir_ordonnance/voir_ordonnance.html.twig', [
            'controller_name' => 'VoirOrdonnanceController',
        ]);
    }
}
